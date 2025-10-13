import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webinar/data/models/category_model.dart';
import 'package:webinar/data/models/transaction_model.dart';
import 'package:webinar/data/repositories/category_repository.dart';
import 'package:webinar/data/repositories/transaction_repository.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class TransactionController extends GetxController {
  final TransactionRepository _transactionRepository =
      Get.find<TransactionRepository>();
  final CategoryRepository _categoryRepository = Get.find<CategoryRepository>();

  final transactions = <TransactionModel>[].obs;
  final categories = <CategoryModel>[].obs;
  final isLoading = false.obs;

  final formKey = GlobalKey<FormBuilderState>();

  @override
  void onInit() {
    super.onInit();
    loadTransactions();
    loadCategories();
  }

  void loadTransactions() {
    isLoading.value = true;
    _transactionRepository.getTransactions().listen(
      (data) {
        transactions.value = data;
        isLoading.value = false;
      },
      onError: (error) {
        isLoading.value = false;
        Get.snackbar(
          'Error',
          'Gagal ambil data transaksi: $error',
          snackPosition: SnackPosition.BOTTOM,
        );
      },
    );
  }

  void loadCategories() {
    _categoryRepository.getCategories().listen(
      (data) {
        categories.value = data;
      },
      onError: (error) {
        Get.snackbar(
          'Error',
          'Gagal ambil data kategori: $error',
          snackPosition: SnackPosition.BOTTOM,
        );
      },
    );
  }

  Future<void> addTransaction() async {
    if (!formKey.currentState!.saveAndValidate()) {
      Get.snackbar(
        'Error',
        'Field cannot be empty',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
    try {
      var data = formKey.currentState!.value;

      final categoryName = categories
          .firstWhereOrNull((cat) => cat.id == data['categoryId'])
          ?.name;

      final transaction = TransactionModel(
        categoryId: data['categoryId'],
        categoryName: categoryName ?? '',
        amount: double.parse(data['amount']),
        type: data['type'],
        date: data['date'],
        notes: data['notes'],
        createdAt: DateTime.now(),
      );
      await _transactionRepository.addTransaction(transaction);
      Get.back();
      Get.snackbar(
        'Success',
        'Transaksi berhasil ditambahkan',
        snackPosition: SnackPosition.BOTTOM,
      );
      clearForm();
    } catch (e) {
      Get.snackbar(
        'Error',
        'Gagal menambahkan transaksi: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> updateTransaction(TransactionModel transaction) async {
    try {
      var data = formKey.currentState!.value;
      final updatedTransaction = transaction.copyWith(
        categoryId: data['categoryId'],
        categoryName: data['categoryName'],
        amount: double.parse(data['amount']),
        type: data['type'],
        date: data['date'],
        notes: data['notes'],
      );

      await _transactionRepository.updateTransaction(updatedTransaction);
      Get.back();
      Get.snackbar(
        'Success',
        'Transaksis berhasil diupdate',
        snackPosition: SnackPosition.BOTTOM,
      );
      clearForm();
    } catch (e) {
      Get.snackbar(
        'Error',
        'Gagal update transaksi: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> deleteTransaction(String transactionId) async {
    try {
      await _transactionRepository.deleteTransaction(transactionId);
      Get.snackbar(
        'Success',
        'Transaksi berhasil dihapus',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Gagal menghapus transaksi: $e',
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
