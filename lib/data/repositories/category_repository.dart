import 'package:get/get.dart';

import '../models/category_model.dart';
import '../services/category_service.dart';

class CategoryRepository {
  final CategoryService _categoryService = Get.find<CategoryService>();

  Stream<List<CategoryModel>> getCategories() {
    return _categoryService.getCategories();
  }

  Future<void> addCategory(CategoryModel category) async {
    await _categoryService.addCategory(category);
  }

  Future<void> updateCategory(CategoryModel category) async {
    await _categoryService.updateCategory(category);
  }

  Future<void> deleteCategory(String categoryId) async {
    await _categoryService.deleteCategory(categoryId);
  }
}
