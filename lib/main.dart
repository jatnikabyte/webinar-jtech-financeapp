import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/dependencies/dependencies.dart';
import 'firebase_options.dart';
import 'modules/dashboard/views/dashboard_view.dart';

import 'core/config/app_theme.dart';

void main() async {
  //Untuk memastikan binding Flutter sudah terinisialisasi
  WidgetsFlutterBinding.ensureInitialized();

  // Inisialisasi firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  //panggil semua dependensi
  Dependencies.init();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Webinar Finance App',
      theme: AppTheme.myTheme,
      home: DashboardView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
