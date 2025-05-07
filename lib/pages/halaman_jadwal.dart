import 'package:flutter/material.dart';

class HalamanJadwal extends StatelessWidget {
  const HalamanJadwal({super.key});

  static const List<Map<String, String>> jadwalKuliah = [
    {
      'hari': 'Senin',
      'matkul': 'E-Business',
      'jam': '08:00 - 10:30',
    },
    {
      'hari': 'Selasa',
      'matkul': 'Metodologi Penelitian',
      'jam': '11:20 - 13:50',
    },
    {
      'hari': 'Rabu',
      'matkul': 'Manajemen Proyek',
      'jam': '09:40 - 12:10',
    },
    {
      'hari': 'Kamis',
      'matkul': 'Kecerdasan Buatan',
      'jam': '08:00 - 10:30',
    },
    {
      'hari': 'Jumat',
      'matkul': 'Data Mining',
      'jam': '10:30 - 12:30',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF000000), // Hitam Targaryen
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: constraints.maxWidth,
                ),
                child: DataTable(
                  headingRowColor: MaterialStateColor.resolveWith(
                        (states) => const Color(0xFF2F4F4F), // Abu-abu besi untuk header
                  ),
                  dataRowColor: MaterialStateColor.resolveWith(
                        (states) => const Color(0xFF1E1E1E), // Warna gelap untuk baris data
                  ),
                  columnSpacing: 24,
                  columns: const [
                    DataColumn(
                      label: Text(
                        'Hari',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFD4AF37), // Emas antik
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Mata Kuliah',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFD4AF37),
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Jam',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFD4AF37),
                        ),
                      ),
                    ),
                  ],
                  rows: jadwalKuliah.map((jadwal) {
                    return DataRow(
                      cells: [
                        DataCell(
                          Text(
                            jadwal['hari'] ?? '-',
                            style: const TextStyle(color: Colors.white70),
                          ),
                        ),
                        DataCell(
                          Text(
                            jadwal['matkul'] ?? '-',
                            style: const TextStyle(color: Colors.white70),
                          ),
                        ),
                        DataCell(
                          Text(
                            jadwal['jam'] ?? '-',
                            style: const TextStyle(color: Colors.white70),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
