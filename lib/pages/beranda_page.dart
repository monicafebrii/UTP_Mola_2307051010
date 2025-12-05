import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  
  get GoogleFonts => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ================= HEADER =================
            Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF1EBE4A), Color(0xFF0B8F3E)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  // Hero Image Bus + People
                  Image.asset(
                    "assets/beranda (3).png",
                    height: 260,
                    fit: BoxFit.contain,
                  ),

                  const SizedBox(height: 12),

                  Text(
                    "Selalu Siap Menjadi\nBagian Dalam Cerita\nPerjalanan Anda.",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // ===== Form Cari Tiket =====
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        _formItem("Asal Keberangkatan"),
                        const SizedBox(height: 10),
                        _formItem("Tujuan Keberangkatan"),
                        const SizedBox(height: 10),
                        _formItem("Tanggal Pergi", value: "Hari ini"),
                        const SizedBox(height: 10),
                        _formItem("Jumlah Kursi", value: "1 kursi"),
                        const SizedBox(height: 16),

                        // BUTTON
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          decoration: BoxDecoration(
                            color: const Color(0xFF0B8F3E),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "Cari Tiket",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ================= JARINGAN AGEN =================
            Text(
              "Jaringan Agen Puspa Jaya",
              style: GoogleFonts.poppins(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                children: [
                  _agenItem("Lampung", "assets/lampung.png"),
                  _agenItem("Jawa Tengah", "assets/jawatengah.png"),
                  _agenItem("Yogyakarta", "assets/jogja.png"),
                  _agenItem("Jawa Timur", "assets/jawatimur.png"),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ================= METODE PEMBAYARAN =================
            Text(
              "Metode Pembayaran",
              style: GoogleFonts.poppins(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            Wrap(
              alignment: WrapAlignment.center,
              spacing: 16,
              runSpacing: 12,
              children: [
                _paymentLogo("assets/bank-bri.png"),
                _paymentLogo("assets/bank-bca-1.png"),
                _paymentLogo("assets/bank-mandir.png"),
                _paymentLogo("assets/bank-bni.png"),
                _paymentLogo("assets/qris-logo.png"),
              ],
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // =============================================================
  // Reusable Widgets
  // =============================================================

  Widget _formItem(String title, {String value = "Pilih"}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: GoogleFonts.poppins(
                  fontSize: 14, fontWeight: FontWeight.w500)),
          Text(value,
              style: GoogleFonts.poppins(
                  fontSize: 13, color: Colors.grey.shade600)),
        ],
      ),
    );
  }

  Widget _agenItem(String name, String image) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.asset(image, height: 130, fit: BoxFit.cover),
          ),
          const SizedBox(height: 8),
          Text(
            name,
            style: GoogleFonts.poppins(fontSize: 14),
          )
        ],
      ),
    );
  }

  Widget _paymentLogo(String image) {
    return Image.asset(image, height: 32);
  }
} 

//n
