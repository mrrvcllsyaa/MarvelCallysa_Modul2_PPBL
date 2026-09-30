import 'package:flutter/material.dart';

import '../pages/beranda_page.dart';
import '../pages/layanan_page.dart';
import '../pages/warga_page.dart';

class KerangkaNavigasi extends StatefulWidget {
  const KerangkaNavigasi({super.key});

  @override
  State<KerangkaNavigasi> createState() =>
      _KerangkaNavigasiState();
}

class _KerangkaNavigasiState
    extends State<KerangkaNavigasi> {
  int indeksAktif = 0;

  final List<Widget> halaman = const [
    BerandaPage(),
    LayananPage(),
    WargaPage(),
  ];

  void ubahHalaman(int index) {
    setState(() {
      indeksAktif = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double lebarLayar =
        MediaQuery.of(context).size.width;

    final bool layarLebar = lebarLayar >= 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Nusantara Cerdas',
        ),
      ),

      // ====================================
      // DRAWER
      // ====================================

      drawer: NavigationDrawer(
        selectedIndex: indeksAktif,

        onDestinationSelected: (index) {
          // Beranda, Layanan, Warga
          if (index <= 2) {
            Navigator.pop(context);

            setState(() {
              indeksAktif = index;
            });

            return;
          }

          // Tutup drawer dahulu
          Navigator.pop(context);

          // Menu pendukung
          if (index == 3) {
            Navigator.pushNamed(
              context,
              '/pengaturan-kota',
            );
          }

          if (index == 4) {
            Navigator.pushNamed(
              context,
              '/tentang-aplikasi',
            );
          }

          if (index == 5) {
            Navigator.pushNamed(
              context,
              '/keluar',
            );
          }
        },

        children: const [
          Padding(
            padding: EdgeInsets.fromLTRB(
              28,
              16,
              16,
              10,
            ),
            child: Text(
              'Menu Utama',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          NavigationDrawerDestination(
            icon: Icon(
              Icons.home_outlined,
            ),
            selectedIcon: Icon(
              Icons.home,
            ),
            label: Text(
              'Beranda',
            ),
          ),

          NavigationDrawerDestination(
            icon: Icon(
              Icons.miscellaneous_services_outlined,
            ),
            selectedIcon: Icon(
              Icons.miscellaneous_services,
            ),
            label: Text(
              'Layanan',
            ),
          ),

          NavigationDrawerDestination(
            icon: Icon(
              Icons.person_outline,
            ),
            selectedIcon: Icon(
              Icons.person,
            ),
            label: Text(
              'Warga',
            ),
          ),

          Padding(
            padding: EdgeInsets.fromLTRB(
              28,
              20,
              16,
              10,
            ),
            child: Text(
              'Menu Pendukung',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          NavigationDrawerDestination(
            icon: Icon(
              Icons.settings_outlined,
            ),
            selectedIcon: Icon(
              Icons.settings,
            ),
            label: Text(
              'Pengaturan Kota',
            ),
          ),

          NavigationDrawerDestination(
            icon: Icon(
              Icons.info_outline,
            ),
            selectedIcon: Icon(
              Icons.info,
            ),
            label: Text(
              'Tentang Aplikasi',
            ),
          ),

          NavigationDrawerDestination(
            icon: Icon(
              Icons.logout_outlined,
            ),
            selectedIcon: Icon(
              Icons.logout,
            ),
            label: Text(
              'Keluar',
            ),
          ),
        ],
      ),

      // ====================================
      // BODY
      // ====================================

      body: Row(
        children: [
          if (layarLebar)
            NavigationRail(
              selectedIndex: indeksAktif,

              onDestinationSelected:
                  ubahHalaman,

              labelType:
                  NavigationRailLabelType.all,

              destinations: const [
                NavigationRailDestination(
                  icon: Icon(
                    Icons.home_outlined,
                  ),
                  selectedIcon: Icon(
                    Icons.home,
                  ),
                  label: Text(
                    'Beranda',
                  ),
                ),

                NavigationRailDestination(
                  icon: Icon(
                    Icons.miscellaneous_services_outlined,
                  ),
                  selectedIcon: Icon(
                    Icons.miscellaneous_services,
                  ),
                  label: Text(
                    'Layanan',
                  ),
                ),

                NavigationRailDestination(
                  icon: Icon(
                    Icons.person_outline,
                  ),
                  selectedIcon: Icon(
                    Icons.person,
                  ),
                  label: Text(
                    'Warga',
                  ),
                ),
              ],
            ),

          Expanded(
            child: IndexedStack(
              index: indeksAktif,
              children: halaman,
            ),
          ),
        ],
      ),

      // ====================================
      // NAVIGATION BAR
      // ====================================

      bottomNavigationBar: layarLebar
          ? null
          : NavigationBar(
              selectedIndex: indeksAktif,

              onDestinationSelected:
                  ubahHalaman,

              destinations: const [
                NavigationDestination(
                  icon: Icon(
                    Icons.home_outlined,
                  ),
                  selectedIcon: Icon(
                    Icons.home,
                  ),
                  label: 'Beranda',
                ),

                NavigationDestination(
                  icon: Icon(
                    Icons.miscellaneous_services_outlined,
                  ),
                  selectedIcon: Icon(
                    Icons.miscellaneous_services,
                  ),
                  label: 'Layanan',
                ),

                NavigationDestination(
                  icon: Icon(
                    Icons.person_outline,
                  ),
                  selectedIcon: Icon(
                    Icons.person,
                  ),
                  label: 'Warga',
                ),
              ],
            ),
    );
  }
}