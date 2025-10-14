import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webinar/core/config/theme.dart';
import 'package:webinar/firebase_options.dart';
import 'package:webinar/routes/route_pages.dart';

import 'core/dependencies/dependency_injection.dart';

void main() async {
  //Untuk memastikan binding Flutter sudah terinisialisasi
  WidgetsFlutterBinding.ensureInitialized();

  // Inisialisasi firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Inisialisasi dependency GetX
  DependencyInjection.init();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Webinar Finance App',
      theme: AppTheme.myTheme,
      getPages: RoutePages.routes,
      initialRoute: '/dashboard',
      debugShowCheckedModeBanner: false,
    );
  }
}
