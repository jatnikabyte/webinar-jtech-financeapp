import 'package:flutter/material.dart';

import '../enums/transaction_types.dart';

class TransactionHelpers {
  static IconData icon(String? value) {
    if (value == TransactionType.income.name) {
      return TransactionType.income.icon;
    } else {
      return TransactionType.expense.icon;
    }
  }

  static Color color(String? value) {
    if (value == TransactionType.income.name) {
      return TransactionType.income.color;
    } else {
      return TransactionType.expense.color;
    }
  }

  static Color backgroundColor(String? value) {
    if (value == TransactionType.income.name) {
      return TransactionType.income.backgroundColor;
    } else {
      return TransactionType.expense.backgroundColor;
    }
  }
}
