import 'package:flutter/material.dart';

class DetailLayananPage extends StatelessWidget {
  const DetailLayananPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    if (args == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Detail Layanan'),
        ),
        body: const Center(
          child: Text('Data layanan tidak ditemukan.'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Layanan'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ICON
            Center(
              child: Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  args['icon'],
                  size: 50,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),

            const SizedBox(height: 25),

            // NAMA LAYANAN
            Text(
              args['nama'] ?? 'Nama Layanan',
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            // DESKRIPSI
            Text(
              args['deskripsi'] ?? 'Deskripsi layanan tidak tersedia.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
                height: 1.5,
              ),
            ),

            const SizedBox(height: 25),

            // DINAS / INSTANSI
            _buildInfo(
              context,
              Icons.account_balance,
              'Dinas / Instansi',
              args['dinas'] ?? 'Tidak tersedia',
            ),

            const SizedBox(height: 15),

            // JAM PELAYANAN
            _buildInfo(
              context,
              Icons.access_time,
              'Jam Pelayanan',
              args['jam'] ?? 'Tidak tersedia',
            ),

            const SizedBox(height: 30),

            // TOMBOL AJUKAN PERMOHONAN
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(
                    context,
                    'Permohonan ${args['nama']} telah diajukan',
                  );
                },
                icon: const Icon(Icons.send),
                label: const Text(
                  'Ajukan Permohonan',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfo(
    BuildContext context,
    IconData icon,
    String label,
    String value,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 28,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
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

