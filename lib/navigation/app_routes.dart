import 'package:flutter/material.dart';

import '../pages/detail_layanan_page.dart';
import '../pages/keluar_page.dart';
import '../pages/layanan_page.dart';
import '../pages/pengaturan_kota_page.dart';
import '../pages/riwayat_laporan_page.dart';
import '../pages/tentang_aplikasi_page.dart';
import '../pages/route_tidak_dikenal_page.dart';
import '../pages/warga_page.dart';

import 'kerangka_navigasi.dart';

class AppRoutes {
  // ==============================
  // NAMA ROUTE
  // ==============================

  static const String beranda = '/';
  static const String layanan = '/layanan';
  static const String warga = '/warga';
  static const String detailLayanan = '/detail-layanan';
  static const String riwayatLaporan = '/riwayat-laporan';
  static const String pengaturanKota = '/pengaturan-kota';
  static const String tentangAplikasi = '/tentang-aplikasi';
  static const String keluar = '/keluar';

  // ==============================
  // DAFTAR ROUTE
  // ==============================

  static Map<String, WidgetBuilder> daftarRoute() {
    return {
      beranda: (context) => const KerangkaNavigasi(),
      layanan: (context) => const LayananPage(),
      warga: (context) => const WargaPage(),
      riwayatLaporan: (context) => const RiwayatLaporanPage(),
      pengaturanKota: (context) => const PengaturanKotaPage(),
      tentangAplikasi: (context) => const TentangAplikasiPage(),
      keluar: (context) => const KeluarPage(),
    };
  }

  // ==============================
  // ON GENERATE ROUTE
  // ==============================

  static Route<dynamic>? bentukRoute(
    RouteSettings settings,
  ) {
    // DETAIL LAYANAN
    if (settings.name == detailLayanan) {
      return MaterialPageRoute(
        builder: (context) => const DetailLayananPage(),
        settings: settings,
      );
    }

    return null;
  }

  // ==============================
  // UNKNOWN ROUTE
  // ==============================

  static Route<dynamic> routeTidakDikenal(
    RouteSettings settings,
  ) {
    return MaterialPageRoute(
      builder: (context) {
        return RouteTidakDikenalPage(
          routeName: settings.name ?? 'Tidak diketahui',
        );
      },
    );
  }
}

