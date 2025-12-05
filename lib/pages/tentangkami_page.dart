import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TentangKamiPage extends StatelessWidget {
  const TentangKamiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // HEADER IMAGE
            Image.asset(
              "assets/tentang_bus.png",
              height: 260,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 12),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Puspa Jaya Transport adalah Perusahaan Otobus asal Lampung yang bergerak "
                "di bidang Jasa Transportasi Darat dengan kendaraan umum Bus...",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(fontSize: 14),
              ),
            ),

            const SizedBox(height: 20),

            // ================= SEJARAH =================
            Text(
              "Sejarah Puspa Jaya",
              style: GoogleFonts.poppins(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _timelineItem("1963", "Perusahaan mulai memberikan layanan transportasi..."),
                  _timelineItem("1978", "Bus-bus baru mulai dioperasikan..."),
                  _timelineItem("1985", "Mulai melayani perjalanan antar kota..."),
                  _timelineItem("1989", "Menambah armada dan rute perjalanan..."),
                  _timelineItem("1992", "Ekspansi lebih luas di berbagai daerah..."),
                  _timelineItem("2000", "Pembaruan armada modern hingga saat ini..."),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ================= VISI MISI =================
            Text(
              "Visi & Misi",
              style: GoogleFonts.poppins(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            _visiMisiCard(
              title: "Visi",
              items: [
                "Menjadi Perusahaan Transportasi Terbaik dengan Orientasi Keselamatan dan Kenyamanan."
              ],
            ),

            const SizedBox(height: 12),

            _visiMisiCard(
              title: "Misi",
              items: [
                "Membangun layanan transportasi yang mengikuti perkembangan jaman.",
                "Memberikan jasa transportasi bus dengan kualitas terbaik.",
                "Membangun SDM profesional dan bertanggung jawab."
              ],
            ),

            const SizedBox(height: 12),

            _visiMisiCard(
              title: "Moto",
              items: ["Aman, Nyaman, Terpercaya"],
            ),

            const SizedBox(height: 20),

            // ================= PENGHARGAAN =================
            Text(
              "Penghargaan",
              style: GoogleFonts.poppins(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 16),

            SizedBox(
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                children: [
                  _awardItem("assets/award1.png", "Penghargaan 2020"),
                  _awardItem("assets/award2.png", "Penghargaan 2021"),
                  _awardItem("assets/award3.png", "Penghargaan 2022"),
                ],
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // ===== WIDGETS =====================================================

  static Widget _timelineItem(String year, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            year,
            style: GoogleFonts.poppins(
                fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.poppins(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _visiMisiCard(
      {required String title, required List<String> items}) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFE9FFE9),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: GoogleFonts.poppins(
                  fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          ...items.map((e) => Text(
                "• $e",
                style: GoogleFonts.poppins(fontSize: 14),
              )),
        ],
      ),
    );
  }

  static Widget _awardItem(String image, String label) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(image, height: 120, fit: BoxFit.cover),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: GoogleFonts.poppins(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
