import 'package:flutter/material.dart';

class AgenPage extends StatelessWidget {
  const AgenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // ===============================
          // HEADER / APPBAR DENGAN GAMBAR
          // ===============================
          SliverAppBar(
            pinned: true,
            expandedHeight: 330,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  // Background Image
                  Positioned.fill(
                    child: Image.asset(
                      "assets/bg_bus_prambanan.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),

                  // Overlay gelap
                  Positioned.fill(
                    child: Container(
                      color: Colors.black.withOpacity(0.4),
                    ),
                  ),

                  // Teks Judul
                  Positioned(
                    left: 20,
                    bottom: 130,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Jaringan Agen",
                          style: TextStyle(
                            fontSize: 34,
                            color: Colors.yellow,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Pencarian Agen",
                          style: TextStyle(
                            fontSize: 32,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Search Box
                  Positioned(
                    left: 15,
                    right: 15,
                    bottom: 40,
                    child: Container(
                      height: 55,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(35),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 8,
                            color: Colors.black26,
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          const Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Cari kota/agen terdekat",
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: const StadiumBorder(),
                            ),
                            child: const Text("Cari Agent"),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ===============================
          // GRID KARTU AGEN
          // ===============================
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverGrid(
              delegate: SliverChildListDelegate([
                buildCard("Lampung", "assets/lampung.jpg", Colors.white),
                buildCard("Jawa Tengah", "assets/jawa_tengah.jpg", Colors.white),
                buildCard("Yogyakarta (D.I.Y)", "assets/yogyakarta.jpg", Colors.yellow.shade300),
                buildCard("Jawa Timur", "assets/jawa_timur.jpg", Colors.white),
              ]),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.85,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ===============================
  // WIDGET CARD AGEN
  // ===============================
  Widget buildCard(String title, String image, Color bgColor) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            blurRadius: 6,
            color: Colors.black12,
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.asset(
                image,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // LABEL LOKASI
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.location_pin, size: 20),
                const SizedBox(width: 4),
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
