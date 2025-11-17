import 'package:flutter/material.dart';
import 'pages/edit_page.dart';
import 'pages/template_page.dart';
import 'pages/proyek_page.dart';
import 'pages/saya_page.dart';

void main() {
  runApp(MovixMockApp());
}

class MovixMockApp extends StatelessWidget {
  const MovixMockApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movix Mock',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeShell(),
    );
  }
}

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeShellState createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    EditPage(),
    TemplatePage(),
    ProyekPage(),
    SayaPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      floatingActionButton: _currentIndex == 2
          ? FloatingActionButton.extended(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Buat proyek baru')),
                );
              },
              icon: Icon(Icons.add),
              label: Text('Buat'),
              backgroundColor: Colors.teal,
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        showUnselectedLabels: true,
        selectedItemColor: Colors.teal[700],
        unselectedItemColor: Colors.grey[600],
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.cut), label: 'Edit'),
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: 'Template'),
          BottomNavigationBarItem(icon: Icon(Icons.folder), label: 'Proyek'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Saya'),
        ],
      ),
    );
  }
}
