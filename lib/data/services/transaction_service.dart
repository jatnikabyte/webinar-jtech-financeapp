import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/transaction_model.dart';

class TransactionService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference get _transactionsRef =>
      _firestore.collection('transactions');

  Stream<List<TransactionModel>> getTransactions() {
    return _transactionsRef
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map(
                (doc) => TransactionModel.fromJson(
                  doc.data() as Map<String, dynamic>,
                  doc.id,
                ),
              )
              .toList(),
        );
  }

  Future<void> addTransaction(TransactionModel transaction) async {
    await _transactionsRef.add(transaction.toJson());
  }

  Future<void> updateTransaction(TransactionModel transaction) async {
    if (transaction.id != null) {
      await _transactionsRef.doc(transaction.id).update(transaction.toJson());
    }
  }

  Future<void> deleteTransaction(String transactionId) async {
    await _transactionsRef.doc(transactionId).delete();
  }
}
