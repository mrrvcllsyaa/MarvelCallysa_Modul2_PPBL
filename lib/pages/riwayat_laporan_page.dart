import 'package:flutter/material.dart';

class RiwayatLaporanPage extends StatefulWidget {
  const RiwayatLaporanPage({super.key});

  @override
  State<RiwayatLaporanPage> createState() => _RiwayatLaporanPageState();
}

class _RiwayatLaporanPageState extends State<RiwayatLaporanPage> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _laporan = [
    {
      'judul': 'Lampu Jalan Mati',
      'lokasi': 'Jl. Merdeka',
      'status': 'Diproses',
      'icon': Icons.lightbulb_outline,
    },
    {
      'judul': 'Jalan Berlubang',
      'lokasi': 'Jl. Sudirman',
      'status': 'Selesai',
      'icon': Icons.warning_amber,
    },
    {
      'judul': 'Sampah Menumpuk',
      'lokasi': 'Jl. Gatot Subroto',
      'status': 'Menunggu',
      'icon': Icons.delete_outline,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Laporan'),
      ),

      // ISI HALAMAN
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _laporan.length,
        itemBuilder: (context, index) {
          final laporan = _laporan[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(laporan['icon']),
              ),
              title: Text(
                laporan['judul'],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                '${laporan['lokasi']}\nStatus: ${laporan['status']}',
              ),
              isThreeLine: true,
              trailing: const Icon(
                Icons.chevron_right,
              ),
            ),
          );
        },
      ),

      // FLOATING ACTION BUTTON
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Membuat laporan baru...'),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),

      // BOTTOM APP BAR
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              tooltip: 'Beranda',
              icon: const Icon(Icons.home_outlined),
              onPressed: () {
                setState(() {
                  _selectedIndex = 0;
                });

                Navigator.pop(context);
              },
            ),
            IconButton(
              tooltip: 'Riwayat',
              icon: const Icon(Icons.history),
              onPressed: () {
                setState(() {
                  _selectedIndex = 1;
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Anda sedang melihat riwayat laporan'),
                  ),
                );
              },
            ),

            const SizedBox(width: 50),

            IconButton(
              tooltip: 'Notifikasi',
              icon: const Icon(Icons.notifications_outlined),
              onPressed: () {
                setState(() {
                  _selectedIndex = 2;
                });

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Tidak ada notifikasi baru'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

