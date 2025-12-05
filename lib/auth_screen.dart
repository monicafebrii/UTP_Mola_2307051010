import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;
  bool _isLogin = true; // true = login, false = register
  String? _statusMessage; // pesan di bawah form (opsional)

  // helper: SnackBar singkat
  void _snack(String text) {
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(SnackBar(content: Text(text)));
  }

  Future<void> _submit() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      _snack('Email dan password wajib diisi.');
      return;
    }

    if (!email.contains('@')) {
      _snack('Masukkan email yang valid.');
      return;
    }

    if (password.length < 6) {
      _snack('Password minimal 6 karakter.');
      return;
    }

    setState(() {
      _isLoading = true;
      _statusMessage = null;
    });

    try {
      final auth = FirebaseAuth.instance;

      if (_isLogin) {
        // LOGIN
        await auth.signInWithEmailAndPassword(
            email: email, password: password);
        _snack('Login berhasil!');
      } else {
        // REGISTER
        await auth.createUserWithEmailAndPassword(
            email: email, password: password);
        _snack('Akun berhasil dibuat!');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        _statusMessage = 'Email belum terdaftar.';
      } else if (e.code == 'email-already-in-use') {
        _statusMessage = 'Email sudah terdaftar.';
      } else {
        _statusMessage = 'Terjadi kesalahan. Coba lagi.';
      }
      _snack(_statusMessage!);
    } catch (e) {
      _statusMessage = 'Terjadi kesalahan. Coba lagi.';
      _snack(_statusMessage!);
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // HEADER
  Widget _buildHeader() {
    return Column(
      children: [
        Container(
          width: 84,
          height: 84,
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.person, size: 44, color: Colors.blue),
        ),
        const SizedBox(height: 12),
        Text(
          _isLogin ? 'Selamat Datang' : 'Buat Akun Baru',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 6),
        Text(
          _isLogin
              ? 'Silakan masuk untuk melanjutkan'
              : 'Isi data untuk membuat akun',
          style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
        ),
      ],
    );
  }

  // FORM INPUT
  Widget _buildForm() {
    return Column(
      children: [
        TextField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.email),
            labelText: 'Email',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),

        const SizedBox(height: 12),

        TextField(
          controller: _passwordController,
          obscureText: true,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.lock),
            labelText: 'Password',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),

        const SizedBox(height: 16),

        _isLoading
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(),
              )
            : SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: _submit,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(_isLogin ? 'Masuk' : 'Daftar'),
                ),
              ),

        const SizedBox(height: 16),

        TextButton(
          onPressed: () {
            setState(() {
              _isLogin = !_isLogin;
              _statusMessage = null;
            });
          },
          child: Text(
            _isLogin
                ? 'Belum punya akun? Daftar'
                : 'Sudah punya akun? Masuk',
          ),
        ),

        if (_statusMessage != null) ...[
          const SizedBox(height: 8),
          Text(
            _statusMessage!,
            style: const TextStyle(color: Colors.red),
            textAlign: TextAlign.center,
          ),
        ],
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(_isLogin ? 'Masuk' : 'Daftar'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                elevation: 6,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18, vertical: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildHeader(),
                      const SizedBox(height: 18),
                      _buildForm(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}