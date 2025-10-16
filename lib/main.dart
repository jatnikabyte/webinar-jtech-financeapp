import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webinar/core/bindings/initial_binding.dart';
import 'package:webinar/firebase_options.dart';
import 'package:webinar/modules/dashboard/views/dashboard_view.dart';

import 'core/config/app_theme.dart';
import 'data/repositories/category_repository.dart';
import 'data/repositories/transaction_repository.dart';
import 'data/services/category_service.dart';
import 'data/services/transaction_service.dart';

void main() async {
  //Untuk memastikan binding Flutter sudah terinisialisasi
  WidgetsFlutterBinding.ensureInitialized();

  // Inisialisasi firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  Get.put(CategoryService());
  Get.put(TransactionService());

  Get.put(CategoryRepository());
  Get.put(TransactionRepository());

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Webinar Finance App',
      theme: AppTheme.myTheme,
      initialBinding: InitialBinding(),
      home: DashboardView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
