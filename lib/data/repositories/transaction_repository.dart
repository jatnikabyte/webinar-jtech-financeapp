import 'package:get/get.dart';

import '../models/transaction_model.dart';
import '../services/transaction_service.dart';

class TransactionRepository {
  final TransactionService _transactionService = Get.find<TransactionService>();

  Stream<List<TransactionModel>> getTransactions() {
    return _transactionService.getTransactions();
  }

  Future<void> addTransaction(TransactionModel transaction) async {
    await _transactionService.addTransaction(transaction);
  }

  Future<void> updateTransaction(TransactionModel transaction) async {
    await _transactionService.updateTransaction(transaction);
  }

  Future<void> deleteTransaction(String transactionId) async {
    await _transactionService.deleteTransaction(transactionId);
  }
}
