import 'package:flutter/material.dart';

class LayananPage extends StatelessWidget {
  const LayananPage({super.key});

  @override
  Widget build(BuildContext context) {
    final perizinan = [
      {
        'nama': 'Izin Usaha',
        'deskripsi': 'Pengajuan izin untuk mendirikan dan menjalankan usaha.',
        'icon': Icons.business,
        'dinas': 'DPMPTSP',
        'jam': '08.00 - 15.00',
      },
      {
        'nama': 'Izin Mendirikan Bangunan',
        'deskripsi': 'Layanan pengajuan izin pembangunan atau renovasi bangunan.',
        'icon': Icons.apartment,
        'dinas': 'Dinas PUPR',
        'jam': '08.00 - 15.00',
      },
      {
        'nama': 'Izin Reklame',
        'deskripsi': 'Pengajuan izin pemasangan reklame di wilayah kota.',
        'icon': Icons.campaign,
        'dinas': 'DPMPTSP',
        'jam': '08.00 - 15.00',
      },
    ];

    final kesehatan = [
      {
        'nama': 'Pendaftaran Puskesmas',
        'deskripsi': 'Layanan pendaftaran pemeriksaan kesehatan di puskesmas.',
        'icon': Icons.local_hospital,
        'dinas': 'Dinas Kesehatan',
        'jam': '07.30 - 14.00',
      },
      {
        'nama': 'Jadwal Dokter',
        'deskripsi': 'Informasi jadwal dokter dan layanan kesehatan.',
        'icon': Icons.medical_services,
        'dinas': 'Dinas Kesehatan',
        'jam': '08.00 - 16.00',
      },
      {
        'nama': 'Layanan Ambulans',
        'deskripsi': 'Permohonan layanan ambulans untuk kondisi darurat.',
        'icon': Icons.emergency,
        'dinas': 'Dinas Kesehatan',
        'jam': '24 Jam',
      },
    ];

    final transportasi = [
      {
        'nama': 'Kartu Transportasi',
        'deskripsi': 'Pengajuan dan informasi kartu transportasi kota.',
        'icon': Icons.credit_card,
        'dinas': 'Dinas Perhubungan',
        'jam': '08.00 - 15.00',
      },
      {
        'nama': 'Informasi Rute',
        'deskripsi': 'Informasi rute dan jalur transportasi umum.',
        'icon': Icons.route,
        'dinas': 'Dinas Perhubungan',
        'jam': '24 Jam',
      },
      {
        'nama': 'Pengaduan Transportasi',
        'deskripsi': 'Laporkan masalah terkait transportasi umum.',
        'icon': Icons.report_problem,
        'dinas': 'Dinas Perhubungan',
        'jam': '24 Jam',
      },
    ];

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Layanan',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                icon: Icon(Icons.description),
                text: 'Perizinan',
              ),
              Tab(
                icon: Icon(Icons.health_and_safety),
                text: 'Kesehatan',
              ),
              Tab(
                icon: Icon(Icons.directions_bus),
                text: 'Transportasi',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildLayananList(context, perizinan),
            _buildLayananList(context, kesehatan),
            _buildLayananList(context, transportasi),
          ],
        ),
      ),
    );
  }

  Widget _buildLayananList(
    BuildContext context,
    List<Map<String, dynamic>> layanan,
  ) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: layanan.length,
      itemBuilder: (context, index) {
        final item = layanan[index];

        return Card(
          margin: const EdgeInsets.only(bottom: 14),
          elevation: 2,
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/detail-layanan',
                arguments: item,
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      item['icon'],
                      size: 30,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['nama'],
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          item['deskripsi'],
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(
                              Icons.account_balance,
                              size: 15,
                              color: Colors.grey[600],
                            ),
                            const SizedBox(width: 5),
                            Text(
                              item['dinas'],
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.chevron_right),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}