import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import '../../../data/models/category_model.dart';
import '../../../data/repositories/category_repository.dart';

class CategoryController extends GetxController {
  final CategoryRepository _categoryRepository = Get.find<CategoryRepository>();

  final categories = <CategoryModel>[].obs;
  final isLoading = false.obs;

  final formKey = GlobalKey<FormBuilderState>();

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  void fetchCategories() {
    isLoading.value = true;
    _categoryRepository.getAll().listen(
      (data) {
        categories.value = data;
        isLoading.value = false;
      },
      onError: (error) {
        isLoading.value = false;
        Get.snackbar(
          'Error',
          'Gagal ambil data category: $error',
          snackPosition: SnackPosition.BOTTOM,
        );
      },
    );
  }

  Future<void> addCategory() async {
    if (!formKey.currentState!.saveAndValidate()) {
      Get.snackbar(
        'Error',
        'Kolom tidak boleh kosong',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    var data = formKey.currentState!.value;

    try {
      final category = CategoryModel(
        name: data['name'],
        createdAt: DateTime.now(),
      );

      await _categoryRepository.add(category);
      Get.back();
      Get.snackbar(
        'Success',
        'Kategori berhasil ditambahkan',
        snackPosition: SnackPosition.BOTTOM,
      );
      clearForm();
    } catch (e) {
      Get.snackbar(
        'Error',
        'Gagal menambahkan kategori: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> updateCategory(CategoryModel category) async {
    try {
      if (!formKey.currentState!.saveAndValidate()) {
        Get.snackbar(
          'Error',
          'Kolom tidak boleh kosong',
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }

      var data = formKey.currentState!.value;
      final updatedCategory = category.copyWith(name: data['name']);

      await _categoryRepository.update(updatedCategory);
      Get.back();
      Get.snackbar(
        'Success',
        'Berhasil update kategori',
        snackPosition: SnackPosition.BOTTOM,
      );
      clearForm();
    } catch (e) {
      Get.snackbar(
        'Error',
        'gagal update kategori: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> deleteCategory(String categoryId) async {
    try {
      await _categoryRepository.delete(categoryId);
      Get.snackbar(
        'Success',
        'Berhasil menghapus kategori',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Gagal menghapus kategori: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void clearForm() {
    formKey.currentState?.reset();
  }

  @override
  void onClose() {
    clearForm();
    super.onClose();
  }
}
