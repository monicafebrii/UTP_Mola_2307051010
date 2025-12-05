import 'package:flutter/material.dart';

class LayananBusPariwisataPage extends StatelessWidget {
  const LayananBusPariwisataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HEADER
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
                      "assets/images/bus_pariwisata.png",
                      width: MediaQuery.of(context).size.width * 0.9,
                    ),
                  ),
                ),
                const Positioned(
                  top: 50,
                  left: 18,
                  child: Text(
                    "Bus Pariwisata",
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

            // TITLE FASILITAS
            const Center(
              child: Text(
                "Fasilitas & Denah Kursi Bus Puspa Jaya Pariwisata",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // PILIHAN JENIS BUS
            Center(
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: const [
                  Chip(label: Text("Executive 30 Seats")),
                  Chip(label: Text("Big Bus 48 Seats")),
                  Chip(label: Text("Big Bus 59 Seats")),
                  Chip(label: Text("Medium Bus 33 Seats")),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // GRID FASILITAS
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Wrap(
                spacing: 15,
                runSpacing: 15,
                children: List.generate(fasilitasPariwisata.length, (i) {
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
                            fasilitasPariwisata[i]['icon'] as IconData,
                            size: 28,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          fasilitasPariwisata[i]['title'],
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),

            const SizedBox(height: 30),

            // DENAH KURSI
            Center(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Image.asset(
                  "assets/images/denah_pariwisata.png",
                  width: 200,
                ),
              ),
            ),

            const SizedBox(height: 40),

            // FOOTER SIMPLE
            Container(
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
}

final List<Map<String, dynamic>> fasilitasPariwisata = [
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
