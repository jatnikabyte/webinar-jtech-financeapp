import 'package:flutter/material.dart';

import '../enums/transaction_types.dart';

class TransactionHelpers {
  static final _map = {
    TransactionType.income.name: TransactionType.income,
    TransactionType.expense.name: TransactionType.expense,
  };
  //TransactionHelpers.
  static IconData icon(String? value) =>
      _map[value]?.icon ?? Icons.help_outline;

  static Color color(String? value) => _map[value]?.color ?? Colors.grey;

  static Color backgroundColor(String? value) =>
      _map[value]?.backgroundColor ?? Colors.grey.shade100;
}
