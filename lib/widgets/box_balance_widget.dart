import 'package:flutter/material.dart';

import 'box_icon_widget.dart';
import 'text_currency_widget.dart';

class BoxBalanceWidget extends StatelessWidget {
  final double number;
  const BoxBalanceWidget({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BoxIconWidget(
          color: Colors.white,
          backgroundColor: Colors.blueAccent,
          icon: Icons.wallet,
        ),
        SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Saldo'),
            TextCurrencyLargeWidget(number: number),
          ],
        ),
      ],
    );
  }
}
