import 'package:flutter/material.dart';
import '../core/utils/utils.dart';

class TextCurrencyLargeWidget extends StatelessWidget {
  final Color color;
  final double number;
  const TextCurrencyLargeWidget({
    super.key,
    required this.number,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      Utils.formatCurrency(number),
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}

class TextCurrencyMediumWidget extends StatelessWidget {
  final Color color;
  final double number;
  const TextCurrencyMediumWidget({
    super.key,
    required this.number,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      Utils.formatCurrency(number),
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color),
    );
  }
}
