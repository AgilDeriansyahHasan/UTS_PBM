import 'package:flutter/material.dart';

class HalamanUtama extends StatefulWidget {
  const HalamanUtama({super.key});

  @override
  State<HalamanUtama> createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  final List<Map<String, dynamic>> _kegiatan = [
    {
      'nama': 'Mengumpulkan UTS PBM',
      'hari': 'Rabu',
      'tanggal': '08-05-2025',
      'selesai': false,
    },
    {
      'nama': 'Presentasi Tugas Manajemen Proyek',
      'hari': 'Kamis',
      'tanggal': '09-05-2025',
      'selesai': false,
    },
    {
      'nama': 'UTS Offline Data Mining',
      'hari': 'Jumat',
      'tanggal': '10-05-2025',
      'selesai': false,
    },
  ];

  void _toggleSelesai(int index) {
    setState(() {
      _kegiatan[index]['selesai'] = !_kegiatan[index]['selesai'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000000), // Hitam pekat
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: _kegiatan.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final item = _kegiatan[index];
          final selesai = item['selesai'] as bool;

          return Container(
            decoration: BoxDecoration(
              color: const Color(0xFF2F4F4F), // Abu-abu besi
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 6,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              leading: Checkbox(
                value: selesai,
                onChanged: (_) => _toggleSelesai(index),
                checkColor: Colors.white,
              ),
              title: Text(
                item['nama'],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFD4AF37), // Emas antik
                  fontSize: 16,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text(
                    'Hari: ${item['hari']}',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    'Tanggal: ${item['tanggal']}',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    'Status: ${selesai ? 'Selesai' : 'Belum selesai'}',
                    style: TextStyle(
                      color: selesai ? Colors.greenAccent : Colors.redAccent,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
