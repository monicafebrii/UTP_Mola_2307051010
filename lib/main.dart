import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:puspajaya_project/pages/agen_page.dart';
import 'package:puspajaya_project/pages/beranda_page.dart';
import 'package:puspajaya_project/pages/layanan_bus_akap_page.dart';
import 'package:puspajaya_project/pages/layanan_bus_pariwisata_page.dart' hide LayananBusPariwisataPage;
import 'package:puspajaya_project/pages/panduan_page.dart';
import 'package:puspajaya_project/pages/tentangkami_page.dart';

// ==== FIREBASE CONFIG ====
import 'firebase_options.dart';

// ==== AUTH SCREEN ====
import 'auth_screen.dart';

// ==== NAVBAR + HALAMAN PUSPA JAYA ====

import 'pages/beranda_page.dart';
import 'widgets/navbar.dart';
import 'pages/tentangkami_page.dart';
import 'pages/layanan_bus_akap_page.dart';
import 'pages/layanan_bus_pariwisata_page.dart';
import 'pages/agen_page.dart';
import 'pages/panduan_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Puspa Jaya Transport",

      home: const AuthWrapper(),

      // === ROUTES ===
      routes: {
        '/beranda': (context) => const HomePage(),
        '/tentang': (context) => const TentangKamiPage(),
        '/akap': (context) => const LayananBusAKAPPage(),
        '/pariwisata': (context) => const LayananBusPariwisataPage(),
        '/agen': (context) => const AgenPage(),
        '/panduan': (context) => const PanduanPage(),
      },
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // Loading saat cek login
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // Sudah login → Masuk aplikasi Puspa Jaya (Navbar)
        if (snapshot.hasData) {
          return const NavbarController();
        }

        // Belum login → ke halaman login
        return const AuthScreen();
      },
    );
  }
}
