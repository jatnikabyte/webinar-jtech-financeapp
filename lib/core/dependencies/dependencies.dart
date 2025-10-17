import 'package:get/get.dart';

import '../../data/repositories/category_repository.dart';
import '../../data/repositories/transaction_repository.dart';
import '../../data/services/category_service.dart';
import '../../data/services/transaction_service.dart';
// import '../../modules/category/controllers/category_controller.dart';

class Dependencies {
  static init() {
    Get.put(CategoryService());
    Get.put(TransactionService());

    Get.put(CategoryRepository());
    Get.put(TransactionRepository());
  }
}
