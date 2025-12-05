import 'package:flutter/material.dart';
import 'package:puspajaya_project/pages/agen_page.dart';
import 'package:puspajaya_project/pages/beranda_page.dart';
import 'package:puspajaya_project/pages/layanan_bus_akap_page.dart';
import 'package:puspajaya_project/pages/layanan_bus_pariwisata_page.dart';
import 'package:puspajaya_project/pages/panduan_page.dart';
import 'package:puspajaya_project/pages/tentangkami_page.dart';
// ignore: depend_on_referenced_packages

class NavbarController extends StatefulWidget {
  const NavbarController({super.key});

  @override
  State<NavbarController> createState() => _NavbarControllerState();
}

class _NavbarControllerState extends State<NavbarController> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),          // BERANDA
    TentangKamiPage(),         // TENTANG KAMI
    LayananBusAKAPPage(),    // LAYANAN PARIWISATA
    LayananBusPariwisataPage(),          // LAYANAN AKAP
    AgenPage(),          // AGEN
    PanduanPage(),       // PANDUAN
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,

        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Beranda",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: "Tentang",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_bus_filled),
            label: "Pariwisata",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_bus),
            label: "AKAP",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.storefront),
            label: "Agen",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help_outline),
            label: "Panduan",
          ),
        ],
      ),
    );
  }
}
