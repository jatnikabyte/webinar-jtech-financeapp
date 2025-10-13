import 'package:get/get.dart';

import '../../data/repositories/category_repository.dart';
import '../../data/repositories/transaction_repository.dart';
import '../../data/services/category_service.dart';
import '../../data/services/transaction_service.dart';

class DependencyInjection {
  static void init() {
    // Services
    Get.put(CategoryService());
    Get.put(TransactionService());

    // Repositories
    Get.put(CategoryRepository());
    Get.put(TransactionRepository());
  }
}
