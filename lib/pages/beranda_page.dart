import 'package:flutter/material.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> pilar = [
      {
        'nama': 'Smart Governance',
        'icon': Icons.account_balance,
        'deskripsi':
            'Tata kelola pemerintahan yang cerdas dan transparan.',
      },
      {
        'nama': 'Smart Branding',
        'icon': Icons.campaign,
        'deskripsi':
            'Membangun citra dan daya tarik kota.',
      },
      {
        'nama': 'Smart Economy',
        'icon': Icons.trending_up,
        'deskripsi':
            'Mendorong pertumbuhan ekonomi berbasis teknologi.',
      },
      {
        'nama': 'Smart Living',
        'icon': Icons.home,
        'deskripsi':
            'Meningkatkan kualitas hidup masyarakat.',
      },
      {
        'nama': 'Smart Society',
        'icon': Icons.groups,
        'deskripsi':
            'Membangun masyarakat yang aktif dan inklusif.',
      },
      {
        'nama': 'Smart Environment',
        'icon': Icons.eco,
        'deskripsi':
            'Mewujudkan lingkungan kota yang berkelanjutan.',
      },
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),

      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [
          Text(
            'Selamat Datang 👋',
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),

          const SizedBox(height: 8),

          Text(
            'Nusantara Cerdas Mobile',
            style: Theme.of(context)
                .textTheme
                .titleMedium,
          ),

          const SizedBox(height: 24),

          const Text(
            'Enam Pilar Smart City',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 16),

          LayoutBuilder(
            builder: (
              BuildContext context,
              BoxConstraints constraints,
            ) {
              int jumlahKolom = 2;

              if (constraints.maxWidth >= 900) {
                jumlahKolom = 3;
              }

              return GridView.builder(
                shrinkWrap: true,

                physics:
                    const NeverScrollableScrollPhysics(),

                itemCount: pilar.length,

                gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: jumlahKolom,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.1,
                ),

                itemBuilder: (
                  BuildContext context,
                  int index,
                ) {
                  final item = pilar[index];

                  return Card(
                    child: Padding(
                      padding:
                          const EdgeInsets.all(16),

                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,

                        children: [
                          Icon(
                            item['icon'] as IconData,
                            size: 36,
                            color: Theme.of(context)
                                .colorScheme
                                .primary,
                          ),

                          const SizedBox(height: 12),

                          Text(
                            item['nama'] as String,
                            style: const TextStyle(
                              fontWeight:
                                  FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),

                          const SizedBox(height: 8),

                          Expanded(
                            child: Text(
                              item['deskripsi']
                                  as String,
                              style: const TextStyle(
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}