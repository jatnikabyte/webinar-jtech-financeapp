import 'package:get/get.dart';

import '../models/transaction_model.dart';
import '../services/transaction_service.dart';

class TransactionRepository {
  final TransactionService _transactionService = Get.find<TransactionService>();

  Stream<List<TransactionModel>> getAll() {
    return _transactionService.getAll();
  }

  Future<void> add(TransactionModel transaction) async {
    await _transactionService.add(transaction);
  }

  Future<void> update(TransactionModel transaction) async {
    await _transactionService.update(transaction);
  }

  Future<void> delete(String transactionId) async {
    await _transactionService.delete(transactionId);
  }
}
