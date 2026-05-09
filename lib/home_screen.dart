import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Data dummy — nanti bisa diganti dengan data dari database
  static const List<Map<String, String>> _daftarMahasiswa = [
    {'nama': 'Andi Pratama', 'nim': '2021001', 'jurusan': 'Teknik Informatika'},
    {'nama': 'Budi Santoso', 'nim': '2021002', 'jurusan': 'Sistem Informasi'},
    {'nama': 'Citra Dewi', 'nim': '2021003', 'jurusan': 'Teknik Informatika'},
    {
      'nama': 'Dian Rahayu',
      'nim': '2021004',
      'jurusan': 'Manajemen Informatika',
    },
    {'nama': 'Eka Kurniawan', 'nim': '2021005', 'jurusan': 'Sistem Informasi'},
    {'nama': 'Fajar', 'nim': '2021005', 'jurusan': 'Sistem Informasi'},
    {'nama': 'Gita', 'nim': '2021006', 'jurusan': 'Teknik Informatika'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '🎓 StudentApp',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Judul bagian statistik ──
            const Text(
              'Ringkasan Data',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // ── Dua kartu statistik berdampingan (Row) ──
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    label: 'Total Mahasiswa',
                    value: '${_daftarMahasiswa.length}',
                    icon: Icons.groups,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    label: 'Status Aktif',
                    value: '5',
                    icon: Icons.check_circle,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // ── Judul daftar mahasiswa ──
            const Text(
              'Daftar Mahasiswa',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // ── ListView ──
            // Expanded wajib di sini agar ListView mengisi sisa ruang
            Expanded(
              child: ListView.builder(
                itemCount: _daftarMahasiswa.length,
                itemBuilder: (context, index) {
                  final mhs = _daftarMahasiswa[index];
                  return _buildMahasiswaCard(
                    nama: mhs['nama']!,
                    nim: mhs['nim']!,
                    jurusan: mhs['jurusan']!,
                    index: index,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Kartu Statistik ──────────────────────────────
  Widget _buildStatCard({
    required String label,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(icon, color: color, size: 32),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            Text(
              label,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  // ── Item Daftar Mahasiswa ─────────────────────────
  Widget _buildMahasiswaCard({
    required String nama,
    required String nim,
    required String jurusan,
    required int index,
  }) {
    // Warna avatar berganti-ganti berdasarkan indeks
    final colors = [
      Colors.blue,
      Colors.orange,
      Colors.green,
      Colors.purple,
      Colors.red,
    ];

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: colors[index % colors.length],
          child: Text(
            nama[0], // huruf pertama nama
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        title: Text(nama, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text('NIM: $nim  ·  $jurusan'),
        trailing: const Icon(Icons.arrow_forward_ios, size: 14),
      ),
    );
  }
}
