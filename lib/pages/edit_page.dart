import 'package:flutter/material.dart';

class EditPage extends StatelessWidget {
  const EditPage({super.key});

  @override
  Widget build(BuildContext context) {
    final iconRows = [
      ['AutoCut', Icons.video_library],
      ['Retouch', Icons.auto_fix_high],
      ['Ruang', Icons.cloud],
      ['Sempurnakan\nsecara otomatis', Icons.auto_awesome],
      ['Editor foto', Icons.photo],
      ['Alat pemasaran', Icons.store],
      ['Pembuat AI', Icons.smart_toy],
      ['Hapus latar', Icons.person_remove],
      ['Keterangan', Icons.closed_caption],
      ['Kamera', Icons.camera_alt],
      ['Alat foto', Icons.photo_library],
      ['Kecepatan', Icons.speed],
      ['Avatar', Icons.account_circle],
      ['Audio', Icons.audiotrack],
      ['Video AI', Icons.movie],
      ['Teleprompter', Icons.text_snippet],
      ['Desktop', Icons.desktop_mac],
      ['Semua alat', Icons.grid_on],
    ];

    return SafeArea(
      child: Scaffold(
        body: Container(
          //  Gradasi latar belakang
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFE1F5FE), // biru lembut
                Colors.white,      // putih
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                const SizedBox(height: 10),

                // Header proyek baru
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 14),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFB3E5FC), Color(0xFFE1F5FE)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.add, color: Colors.white),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'Proyek baru',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                //  ini gambar bagian atas Thumbnails
                SizedBox(
                  height: 74,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, i) => ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        width: 74,
                        height: 74,
                        color: Colors.grey[300],
                        child: Image.asset('assets/monaaa.jpeg',
                              fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    separatorBuilder: (_, __) => const SizedBox(width: 8),
                    itemCount: 6,
                  ),
                ),

                const SizedBox(height: 18),

                // 🔹 Grid menu
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: iconRows.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 1.05,
                  ),
                  itemBuilder: (_, idx) {
                    final label = iconRows[idx][0] as String;
                    final icon = iconRows[idx][1] as IconData;
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFFB3E5FC), Color(0xFFE1F5FE)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(14),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 4,
                                offset: Offset(1, 2),
                              ),
                            ],
                          ),
                          child: Icon(icon, size: 26, color: Colors.black87),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          label,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 12),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    );
                  },
                ),

                const SizedBox(height: 60), // biar nggak ketutup navbar bawah
              ],
            ),
          ),
        ),
      ),
    );
  }
}
