// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class TemplatePage extends StatelessWidget {
  const TemplatePage({super.key});
// tulisan di dalam kotak
  final List<String> sampleTitles = const [
    'Filter Aesthetic',
    'Versi Ipin Pose',
    'Liburan Bersama',
    'SCTV Mempersembahkan',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //  HEADER DENGAN GRADIENT
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(bottom: 12),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF4A90E2), // biru muda
                    Color.fromARGB(255, 228, 225, 230), // ungu
                    // Color(0xFF9013FE), // ungu
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                children: [
                  // Pencarian Search bar
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 44,
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              // ignore: duplicate_ignore
                              // ignore: deprecated_member_use
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.white24),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    'Emang kamu bisa berubah?',
                                    style: TextStyle(color: Colors.white70),
                                  ),
                                ),
                                const Icon(Icons.search, color: Colors.white70),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.15),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.question_mark,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),

                  //  teks Mengikuti for youChips
                  SizedBox(
                    height: 44,
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      scrollDirection: Axis.horizontal,
                      children: const [
                        Chip(
                          label: Text('Mengikuti'),
                          backgroundColor: Colors.white24,
                          labelStyle: TextStyle(color: Color.fromARGB(255, 23, 22, 22)),
                        ),
                        SizedBox(width: 8),
                        Chip(
                          label: Text('For you'),
                          backgroundColor: Color.fromARGB(255, 231, 205, 205),
                          labelStyle: TextStyle(color: Color.fromARGB(255, 32, 24, 24)),
                        ),
                        SizedBox(width: 8),
                        Chip(
                          label: Text('Beat'),
                          backgroundColor: Colors.white24,
                          labelStyle: TextStyle(color: Color.fromARGB(255, 37, 36, 36)),
                        ),
                        SizedBox(width: 8),
                        Chip(
                          label: Text('Meme'),
                          backgroundColor: Colors.white24,
                          labelStyle: TextStyle(color: Color.fromARGB(255, 20, 18, 18)),
                        ),
                        SizedBox(width: 8),
                        Chip(
                          label: Text('Lirik Video'),
                          backgroundColor: Colors.white24,
                          labelStyle: TextStyle(color: Color.fromARGB(255, 18, 17, 17)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Grid Template
            Expanded(
              child: Container(
                color: Colors.white,
                child: GridView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.78,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: sampleTitles.length,
                  itemBuilder: (_, i) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(12),
                                ),
                              ),
                              child: Image.asset('assets/monaaa.jpeg',
                              fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  sampleTitles[i],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 6),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'by user',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                    Row(
                                      children: const [
                                        Icon(Icons.cut, size: 14),
                                        SizedBox(width: 4),
                                        Text('89.8K',
                                            style: TextStyle(fontSize: 12)),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
