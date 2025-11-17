import 'package:flutter/material.dart';

class SayaPage extends StatelessWidget {
  const SayaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // ==== HEADER PROFIL ====
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFE6F8FF), Color(0xFFDFF6FF)],
                ),
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(18)),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.teal,
                    child: Text('M', style: TextStyle(fontSize: 22, color: Colors.white)),
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Monica Febi',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text('Standar', style: TextStyle(fontSize: 12)),
                          ),
                          SizedBox(width: 8),
                          Text('Lihat profil >', style: TextStyle(color: Colors.grey[700])),
                        ],
                      )
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.notifications_none),
                  SizedBox(width: 8),
                  Icon(Icons.settings),
                ],
              ),
            ),

            SizedBox(height: 12),

            // ==== KARTU STANDARD ====
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Stack(
                children: [
                  // Kartu utama
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFFDAF4FF), Color(0xFFCFF2FF)],
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text('Standard',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18)),
                            SizedBox(width: 10),
                            Text(
                              'paket Standar hanya dengan Rp1,000',
                              style: TextStyle(color: Colors.grey[400]),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _iconColumn(Icons.menu_book, 'Materi'),
                            _iconColumn(Icons.widgets, 'Alat Pro'),
                            _iconColumn(Icons.star_border, 'Efek AI'),
                            _iconColumn(Icons.auto_fix_high, 'Retouch'),
                          ],
                        )
                      ],
                    ),
                  ),

      
                ],
              ),
            ),

            SizedBox(height: 12),

            //  MENU LIST 
            Expanded(
              child: ListView(
                children: [
                  _menuTile('Acara', Icons.emoji_events),
                  _menuTile('Dibeli', Icons.shopping_cart),
                  _menuTile('Suka dan Favorit', Icons.bookmark),
                  _menuTile('Lihat riwayat', Icons.history),
                  SizedBox(height: 8),
                  Divider(),
                  _menuTile('Pusat Bantuan', Icons.help_outline),
                  _menuTile('Pindai', Icons.qr_code_scanner),
                  SizedBox(height: 160),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // komponen 
  Widget _iconColumn(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon),
        ),
        SizedBox(height: 6),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _menuTile(String title, IconData icon) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: Icon(Icons.chevron_right),
      onTap: () {},
    );
  }
}
