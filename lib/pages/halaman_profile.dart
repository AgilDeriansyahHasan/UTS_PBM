import 'package:flutter/material.dart';

class HalamanProfile extends StatefulWidget {
  const HalamanProfile({super.key});

  @override
  State<HalamanProfile> createState() => _HalamanProfileState();
}

class _HalamanProfileState extends State<HalamanProfile> {
  bool _isDarkMode = true; // Default ke mode "Team Black"

  @override
  Widget build(BuildContext context) {
    final backgroundColor = _isDarkMode
        ? const Color(0xFF000000) // Hitam Targaryen
        : Colors.white; // Putih polos (mode cerah)

    final textColor = _isDarkMode
        ? const Color(0xFFD4AF37) // Emas antik
        : Colors.black87; // Teks gelap untuk mode terang

    final cardColor = _isDarkMode
        ? const Color(0xFF2F4F4F) // Abu-abu besi
        : Colors.white; // Kartu putih polos

    final iconColor = _isDarkMode
        ? const Color(0xFFB22222) // Merah naga
        : Colors.black87; // Ikon gelap untuk terang

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Row(
            children: [
              Icon(
                _isDarkMode ? Icons.dark_mode : Icons.light_mode,
                color: iconColor,
              ),
              Switch(
                value: _isDarkMode,
                onChanged: (val) => setState(() => _isDarkMode = val),
                activeColor: const Color(0xFFB22222), // Merah naga
                inactiveThumbColor: Colors.grey[300],
              ),
              const SizedBox(width: 12),
            ],
          ),
        ],
        iconTheme: IconThemeData(color: iconColor),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildProfileCard(
            imagePath: 'assets/images/agil.jpg',
            nama: 'Agil Deriansyah Hasan',
            nim: '4522210125',
            email: 'agil@gmail.com',
            backgroundColor: cardColor,
            textColor: textColor,
          ),
          const SizedBox(height: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/images/buku.jpg',
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Di bawah langit senja, pikiranku terbang seperti naga.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 16,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileCard({
    required String imagePath,
    required String nama,
    required String nim,
    required String email,
    required Color backgroundColor,
    required Color textColor,
  }) {
    return Card(
      color: backgroundColor,
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      shadowColor: const Color(0xFFB22222), // Bayangan merah darah
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                imagePath,
                width: 140,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Divider(color: textColor.withOpacity(0.5), thickness: 1),
            const SizedBox(height: 12),
            _buildInfoRow(label: 'Nama', value: nama, valueColor: textColor),
            _buildInfoRow(label: 'NIM', value: nim, valueColor: textColor),
            _buildInfoRow(label: 'Email', value: email, valueColor: textColor),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow({
    required String label,
    required String value,
    required Color valueColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label:',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: valueColor,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: TextStyle(fontSize: 16, color: valueColor),
            ),
          ),
        ],
      ),
    );
  }
}
