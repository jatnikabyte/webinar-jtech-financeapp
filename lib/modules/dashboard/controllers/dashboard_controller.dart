import 'package:get/get.dart';
import 'package:webinar/data/models/transaction_model.dart';
import 'package:webinar/data/repositories/transaction_repository.dart';

class DashboardController extends GetxController {
  final TransactionRepository _transactionRepository =
      Get.find<TransactionRepository>();

  final transactions = <TransactionModel>[].obs;
  final isLoading = false.obs;
  final balance = 0.0.obs;
  final totalIncome = 0.0.obs;
  final totalExpense = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    loadDashboardData();
  }

  void loadDashboardData() {
    isLoading.value = true;
    _transactionRepository.getAll().listen(
      (data) {
        transactions.value = data;
        calculateTotals();
        isLoading.value = false;
      },
      onError: (error) {
        isLoading.value = false;
        Get.snackbar(
          'Error',
          'Failed to load dashboard data: $error',
          snackPosition: SnackPosition.BOTTOM,
        );
      },
    );
  }

  void calculateTotals() {
    double income = 0.0;
    double expense = 0.0;

    for (var transaction in transactions) {
      if (transaction.type == 'income') {
        income += transaction.amount;
      } else {
        expense += transaction.amount;
      }
    }

    totalIncome.value = income;
    totalExpense.value = expense;
    balance.value = income - expense;
  }

  List<TransactionModel> getRecentTransactions({int limit = 5}) {
    return transactions.take(limit).toList();
  }
}
