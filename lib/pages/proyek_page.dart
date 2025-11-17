import 'package:flutter/material.dart';
// generet jadi 10 list
class ProyekPage extends StatelessWidget {
  final List<Map<String, String>> items = List.generate(10, (i) {
    return {
      'title': i == 0 ? 'Instrument only' : '0923-01',
      'date': '0${8 + i}/10/2025 23:${(10 + i).toString().padLeft(2, '0')}',
      'size': '${(i + 1) * 100}MB',
      'dur': '00:${(10 + i).toString().padLeft(2, '0')}',
    };
  });

  ProyekPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // ==== HEADER DENGAN GRADIENT ====
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF4A90E2), // biru muda
                    Color.fromARGB(255, 80, 232, 237), // ungu
                    //  Color(0xFF9013FE), // ungu
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Row(
                children: [
                  Text(
                    'Proyek',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.search, color: Colors.white), //icon pencarian
                  SizedBox(width: 12),
                  Icon(Icons.more_vert, color: Colors.white), // icon titik 3
                ],
              ),
            ),

            

            // // ==== FILTER TAB ====
            // Container(
            //   height: 56,
            //   padding: EdgeInsets.only(left: 14, right: 14),
            //   child: ListView(
            //     scrollDirection: Axis.horizontal,
            //     children: [
            //       FilterChip(label: Text('Lokal'), selected: true, onSelected: (_) {}),
            //       SizedBox(width: 8),
            //       FilterChip(label: Text('Ruang'), selected: false, onSelected: (_) {}),
            //       SizedBox(width: 8),
            //       FilterChip(label: Text('Media'), selected: false, onSelected: (_) {}),
            //       SizedBox(width: 8),
            //       FilterChip(label: Text('Sampah'), selected: false, onSelected: (_) {}),
            //     ],
            //   ),
            // ),

            // ==== CATEGORY CHIPS atas di bawah proyek ====
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: Row(
                children: [
                  ChoiceChip(label: Text('Semua'), selected: true, onSelected: (_) {}),
                  SizedBox(width: 8),
                  ChoiceChip(label: Text('Edit'), selected: false, onSelected: (_) {}),
                  SizedBox(width: 8),
                  ChoiceChip(label: Text('Template'), selected: false, onSelected: (_) {}),
                  SizedBox(width: 8),
                  ChoiceChip(label: Text('Kamera'), selected: false, onSelected: (_) {}),
                  SizedBox(width: 8),
                  ChoiceChip(label: Text('Bisnis'), selected: false, onSelected: (_) {}),
                ],
              ),
            ),

            // ==== JUMLAH PROYEK ====
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              child: Row(
                children: [
                  Text('447 proyek', style: TextStyle(color: Colors.grey[700])),
                  Spacer(),
                  Text('Pilih', style: TextStyle(color: Colors.teal)),
                ],
              ),
            ),

            // ==== LIST PROYEK ====
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 14),
                itemCount: items.length,
                separatorBuilder: (_, __) => Divider(),
                itemBuilder: (_, i) {
                  final it = items[i];
                  return ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        width: 56,
                        height: 56,
                        color: Colors.grey[300],
                        child: Image.asset('assets/monaaa.jpeg', fit: BoxFit.cover,) //Icon(Icons.image, color: Colors.grey[700]),
                      ),
                    ),
                    title: Text(it['title']!),
                    subtitle: Text('${it['date']} • ${it['size']} • ${it['dur']}'),
                    trailing: Icon(Icons.more_vert), //icon titik 3
                    onTap: () {},
                  );
                },
              ),
            ),
          ],
        ),
        
        //  TOMBOL HIJAU “+ BUAT” 
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            // Aksi ketika ditekan
            // Contoh: Navigator.push ke halaman buat proyek baru
          },
          label: Text('Buat'),
          icon: Icon(Icons.add),
          // backgroundColor: Colors.teal,
          backgroundColor: const Color.fromARGB(255, 17, 57, 53),
          elevation: 4,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
      
    
  

