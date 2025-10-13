import 'package:flutter/material.dart';

enum TransactionType { income, expense }

extension TransactionTypeExtension on TransactionType {
  String get value {
    switch (this) {
      case TransactionType.income:
        return 'Pemasukan';
      case TransactionType.expense:
        return 'Pengeluaran';
    }
  }

  IconData get icon {
    switch (this) {
      case TransactionType.income:
        return Icons.arrow_upward;
      case TransactionType.expense:
        return Icons.arrow_downward;
    }
  }

  Color get color {
    switch (this) {
      case TransactionType.income:
        return Colors.green;
      case TransactionType.expense:
        return Colors.red;
    }
  }

  Color get backgroundColor {
    switch (this) {
      case TransactionType.income:
        return Colors.green.shade50;
      case TransactionType.expense:
        return Colors.red.shade50;
    }
  }
}
