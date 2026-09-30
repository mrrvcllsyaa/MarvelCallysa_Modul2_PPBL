import 'package:flutter/material.dart';

class WargaPage extends StatelessWidget {
  const WargaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Warga'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Halo, Warga!',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              'Kelola aktivitas dan laporan layanan warga.',
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey[600],
              ),
            ),

            const SizedBox(height: 25),

            // MENU RIWAYAT LAPORAN
            Card(
              child: ListTile(
                leading: const CircleAvatar(
                  child: Icon(Icons.history),
                ),
                title: const Text(
                  'Riwayat Laporan',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text(
                  'Lihat riwayat laporan yang pernah dibuat',
                ),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/riwayat-laporan',
                  );
                },
              ),
            ),

            const SizedBox(height: 15),

            // MENU PROFIL WARGA
            Card(
              child: ListTile(
                leading: const CircleAvatar(
                  child: Icon(Icons.person_outline),
                ),
                title: const Text(
                  'Profil Warga',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text(
                  'Informasi profil warga',
                ),
                trailing: const Icon(Icons.chevron_right),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Menu Profil Warga'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}