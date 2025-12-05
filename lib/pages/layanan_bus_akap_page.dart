import 'package:flutter/material.dart';

class LayananBusAKAPPage extends StatelessWidget {
  const LayananBusAKAPPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ============================
            // HEADER
            // ============================
            Stack(
              children: [
                Container(
                  height: 240,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xff009344), Color(0xff00B15D)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Image.asset(
                      "assets/images/bus_akap.png",
                      width: MediaQuery.of(context).size.width * 0.9,
                    ),
                  ),
                ),
                const Positioned(
                  top: 50,
                  left: 18,
                  child: Text(
                    "Bus AKAP",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // ============================
            // JUDUL
            // ============================
            const Center(
              child: Text(
                "Fasilitas Bus Puspa Jaya Antar Kota Antar Provinsi (AKAP)",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 16),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Armada yang melayani adalah Bus Reguler Kelas Eksekutif dengan fasilitas sebagai berikut:",
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 20),

            // ============================
            // GRID FASILITAS
            // ============================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Wrap(
                spacing: 15,
                runSpacing: 15,
                children: List.generate(fasilitasAKAP.length, (i) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width / 3 - 30,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: Icon(
                            fasilitasAKAP[i]['icon'] as IconData,
                            size: 28,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          fasilitasAKAP[i]['title'] as String,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),

            const SizedBox(height: 30),

            // ============================
            // INTERIOR GAMBAR
            // ============================
            SizedBox(
              height: 170,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  interiorItem("assets/images/interior1.jpg"),
                  interiorItem("assets/images/interior2.jpg"),
                  interiorItem("assets/images/denah_akap.png"),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // ============================
            // FOOTER
            // ============================
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              color: const Color(0xff009344),
              child: const Center(
                child: Text(
                  "© 2025 Puspa Jaya",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================
  // WIDGET GAMBAR INTERIOR
  // ============================
  Widget interiorItem(String img) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      width: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(img, fit: BoxFit.cover),
      ),
    );
  }
}

// ============================
// DATA FASILITAS AKAP
// ============================
final List<Map<String, dynamic>> fasilitasAKAP = [
  {"icon": Icons.tv, "title": "LCD TV"},
  {"icon": Icons.ac_unit, "title": "AC"},
  {"icon": Icons.wc, "title": "Toilet"},
  {"icon": Icons.music_note, "title": "Entertainment"},
  {"icon": Icons.airline_seat_legroom_extra, "title": "Bantal Leher"},
  {"icon": Icons.bed, "title": "Selimut"},
  {"icon": Icons.restaurant, "title": "Voucher Makan"},
  {"icon": Icons.fastfood, "title": "Snack"},
  {"icon": Icons.usb, "title": "USB Port"},
  {"icon": Icons.event_seat, "title": "30 Seats"},
  {"icon": Icons.chair, "title": "Leg Rest"},
  {"icon": Icons.recycling, "title": "Recycling Seat"},
];
