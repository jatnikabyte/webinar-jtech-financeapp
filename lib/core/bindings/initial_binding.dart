import 'package:get/get.dart';

import '../../data/repositories/category_repository.dart';
import '../../data/repositories/transaction_repository.dart';
import '../../data/services/category_service.dart';
import '../../data/services/transaction_service.dart';
// import '../../modules/category/controllers/category_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    // Dependency injection
    // Get.lazyPut(() => CategoryRepository(Get.find<>()));
    // Get.lazyPut(() => CategoryController(Get.find<>()));

    // Repositories (daftarkan lebih dulu)
    Get.put(CategoryService());
    Get.put(TransactionService());

    Get.put(CategoryRepository());
    Get.put(TransactionRepository());

    // Services (inject repository sebagai dependency)
    // Get.put(TransactionService());
  }
}
