import 'package:flutter/material.dart';

class KeluarPage extends StatelessWidget {
  const KeluarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keluar'),
      ),
      body: const Center(
        child: Text('Halaman Keluar'),
      ),
    );
  }
}