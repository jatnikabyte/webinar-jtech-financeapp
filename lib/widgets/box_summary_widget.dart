import 'package:flutter/material.dart';
import '../../../widgets/text_currency_widget.dart';

class BoxSummaryWidget extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  final IconData icon;
  final double number;
  final String title;
  const BoxSummaryWidget({
    super.key,
    required this.color,
    required this.backgroundColor,
    required this.icon,
    required this.number,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        height: 70,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 15, color: color),
                Text(title),
              ],
            ),
            TextCurrencyMediumWidget(number: number),
          ],
        ),
      ),
    );
  }
}
