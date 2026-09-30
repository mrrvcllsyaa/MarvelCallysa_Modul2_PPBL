import 'package:flutter/material.dart';

class RouteTidakDikenalPage extends StatelessWidget {
  final String routeName;

  const RouteTidakDikenalPage({
    super.key,
    required this.routeName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Halaman Tidak Ditemukan',
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                size: 80,
              ),

              const SizedBox(height: 20),

              const Text(
                '404',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'Route yang Anda cari tidak tersedia.',
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 10),

              Text(
                routeName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}