import 'package:flutter/material.dart';

class PanduanPage extends StatelessWidget {
  const PanduanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // ===========================================================
          // HEADER DENGAN GAMBAR HIJAU
          // ===========================================================
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            expandedHeight: 330,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      "assets/header_bus.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),

                  Positioned.fill(
                    child: Container(color: Colors.black.withOpacity(0.3)),
                  ),

                  // MAIN CONTENT TEXT
                  Positioned(
                    left: 20,
                    bottom: 40,
                    child: const SizedBox(
                      width: 300,
                      child: Text(
                        "Karena Setiap Perjalanan Berarti Aman, Nyaman,\ndan Terpercaya.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          height: 1.3,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ===========================================================
          // JUDUL SECTION
          // ===========================================================
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Center(
                child: Text(
                  "Pemesanan Tiket Bus AKAP",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
              ),
            ),
          ),

          // ===========================================================
          // CARD PANDUAN WEBSITE
          // ===========================================================
          SliverToBoxAdapter(
            child: buildGuideCard(
              title: "Pemesanan Tiket Melalui Website",
              steps: [
                buildStep(
                  "Buka Website",
                  [
                    "Masuk melalui menu pemesanan tiket Puspa Jaya di www.puspajaya.id."
                  ],
                ),
                buildStep(
                  "Cari Tiket",
                  [
                    "Isi data perjalanan:",
                    "1. Kota asal",
                    "2. Kota tujuan",
                    "3. Tanggal perjalanan",
                    "4. Jumlah kursi",
                  ],
                ),
                buildStep(
                  "Pilih Tiket",
                  [
                    "Pilih tiket keberangkatan dan klik bagian jadwal sesuai yang Anda inginkan."
                  ],
                ),
                buildStep(
                  "Isi Data",
                  [
                    "Mengisi nama dan jenis kelamin sesuai dengan kartu identitas (KTP/SIM/KK).",
                    "Mengisi nomor HP yang aktif.",
                    "Mengisi email yang aktif untuk pengiriman e-ticket."
                  ],
                ),
                buildStep(
                  "Cek Status Pemesanan",
                  [
                    "Sebelum melakukan pembayaran, pastikan status pemesanan sesuai dengan jadwal keberangkatan."
                  ],
                ),
                buildStep(
                  "Metode Pembayaran",
                  ["Lakukan pembayaran sesuai metode yang ditampilkan."],
                ),
                buildStep(
                  "Tiket dikirim ke Email",
                  [
                    "Setelah pembayaran terkonfirmasi, e-ticket akan dikirimkan ke alamat email."
                  ],
                ),
              ],
            ),
          ),

          // ===========================================================
          // CARD PANDUAN WHATSAPP
          // ===========================================================
          SliverToBoxAdapter(
            child: buildGuideCard(
              title: "Pemesanan Tiket Melalui WhatsApp",
              steps: [
                buildStep(
                  "Penumpang dapat melihat daftar agen dibagian “Agen Perwakilan”.",
                  [],
                ),
                buildStep(
                  "Cari kontak agen yang ingin anda pilih sebagai titik keberangkatan.",
                  [],
                ),
                buildStep(
                  "Hubungi agen perwakilan tersebut sesuai dengan jam operasional yang sudah tertera.",
                  [],
                ),
                buildStep(
                  "Isi data reservasi yang telah disediakan oleh agen perwakilan tersebut.",
                  [],
                ),
                buildStep(
                  "Pilih metode pembayaran.",
                  [],
                ),
                buildStep(
                  "Setelah pembayaran terkonfirmasi, agen akan mengirimkan e-ticket atau foto berupa tiket fisik.",
                  [],
                ),
              ],
            ),
          ),

          // ===========================================================
          // CARD PANDUAN PEMESANAN LANGSUNG
          // ===========================================================
          SliverToBoxAdapter(
            child: buildGuideCard(
              title: "Pemesanan Tiket Langsung ke Agen Perwakilan",
              steps: [
                buildStep(
                  "Datang langsung ke Agen Perwakilan",
                  [
                    "Pemesanan tiket bus juga dapat dilakukan secara offline dengan datang ke lokasi agen perwakilan terdekat."
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // ===========================================================
          // PEMESANAN PARIWISATA
          // ===========================================================
          SliverToBoxAdapter(
            child: Column(
              children: [
                const Text(
                  "Reservasi Bus Pariwisata",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.green.shade700,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Text(
                      "Hubungi nomor Whatsapp berikut untuk informasi reservasi bus pariwisata!\n"
                      "0816-145-2000 (Jam Operasional 08:00–19:00 WIB)",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        height: 1.4,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ===========================================================
  // WIDGET CARD PANDUAN
  // ===========================================================
  Widget buildGuideCard({
    required String title,
    required List<Widget> steps,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.green, width: 1.3),
        boxShadow: const [
          BoxShadow(
            blurRadius: 8,
            color: Colors.black12,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          ...steps,
        ],
      ),
    );
  }

  // ===========================================================
  // WIDGET STEP PANDUAN
  // ===========================================================
  Widget buildStep(String title, List<String> sublines) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // BULATAN NOMOR
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: Colors.green.shade700,
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Text(
                "1",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          const SizedBox(width: 12),

          // TEKS LANGKAH
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (sublines.isNotEmpty) const SizedBox(height: 4),
                ...sublines.map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(
                      e,
                      style: const TextStyle(fontSize: 14, height: 1.3),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
