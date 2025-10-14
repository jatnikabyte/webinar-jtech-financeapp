import 'package:get/get.dart';

import '../models/category_model.dart';
import '../services/category_service.dart';

class CategoryRepository {
  final CategoryService _categoryService = Get.find<CategoryService>();

  Stream<List<CategoryModel>> getAll() {
    return _categoryService.getAll();
  }

  Future<void> add(CategoryModel category) async {
    await _categoryService.add(category);
  }

  Future<void> update(CategoryModel category) async {
    await _categoryService.update(category);
  }

  Future<void> delete(String categoryId) async {
    await _categoryService.delete(categoryId);
  }
}
