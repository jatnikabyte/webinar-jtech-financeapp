import 'package:flutter/material.dart';

enum TransactionType { income, expense }

extension TransactionTypeX on TransactionType {
  static const Map _labels = {
    TransactionType.income: 'Pemasukan',
    TransactionType.expense: 'Pengeluaran',
  };

  static const Map _icons = {
    TransactionType.income: Icons.arrow_upward,
    TransactionType.expense: Icons.arrow_downward,
  };

  static const Map _colors = {
    TransactionType.income: Colors.green,
    TransactionType.expense: Colors.red,
  };

  static const Map _bgColors = {
    TransactionType.income: Color(0xFFE8F5E9),
    TransactionType.expense: Color(0xFFFFEBEE),
  };

  String get value => _labels[this]!;
  IconData get icon => _icons[this]!;
  Color get color => _colors[this]!;
  Color get backgroundColor => _bgColors[this]!;
}
