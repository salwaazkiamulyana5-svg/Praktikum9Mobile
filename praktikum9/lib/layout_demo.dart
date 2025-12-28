import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Layout: [Salwa Azkia] - [707012400029]',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LayoutDemo(),
    );
  }
}

class LayoutDemo extends StatelessWidget {
  const LayoutDemo({super.key});

  // ==================== TUGAS 1: TITLE SECTION ====================
  Widget _buildTitleSection() {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /* soal a: Letakkan widget Column di dalam Expanded */
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, /* soal a: posisi di awal baris */
              children: [
                /* soal b: Container dengan padding bottom */
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Telkom University',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Jl. Telekomunikasi No.1, Sukapura, Kec. Dayeuhkolot, Kabupaten Bandung, Jawa Barat 40257',
                  style: TextStyle(
                    color: Colors.grey[500], /* soal b: warna abu-abu */
                  ),
                ),
              ],
            ),
          ),
          /* soal c: Icon bintang dan teks */
          Icon(
            Icons.star,
            color: Colors.red[500], /* soal c: warna merah */
          ),
          const Text('41'),
        ],
      ),
    );
  }

  // ==================== TUGAS 2: BUTTON BUILDER ====================
  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

  // ==================== TUGAS 2: BUTTON SECTION ====================
  Widget _buildButtonSection(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );
  }

  // ==================== TUGAS 3: TEXT SECTION ====================
  Widget _buildTextSection() {
    return Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        'Telkom University adalah perguruan tinggi swasta yang terletak di Bandung, Jawa Barat. '
        'Kampus ini dikenal dengan fokusnya pada bidang teknologi informasi dan komunikasi. '
        'Dengan fasilitas modern dan lingkungan kampus yang asri, Telkom University menjadi salah satu '
        'perguruan tinggi favorit di Indonesia.\n\n'
        'Nama: [SALWA AZKIA MULYANA]\n' 
        'NIM: [707012400029]\n\n'          
        'Selamat mengerjakan! 😊',
        softWrap: true, /* soal: softWrap = true */
        style: TextStyle(
          fontSize: 16,
          height: 1.5,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Layout Demo'),
        backgroundColor: Colors.green[700],
      ),
      // ==================== TUGAS 4: LISTVIEW DENGAN IMAGE ====================
      body: ListView(
        children: [
          // Image Section - Tugas 4
          Image.asset(
            'assets/images/telkom.jpeg',
            width: 600,
            height: 240,
            fit: BoxFit.contain, /* soal: BoxFit.cover */
            errorBuilder: (context, error, stackTrace) {
              // Fallback jika gambar tidak ada
              return Container(
                height: 240,
                color: Colors.grey[300],
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.image,
                      size: 64,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'telkom.jpeg\nTambahkan di folder assets/images/',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              );
            },
          ),
          _buildTitleSection(),    // Tugas 1
          _buildButtonSection(context), // Tugas 2
          _buildTextSection(),     // Tugas 3
        ],
      ),
    );
  }
}