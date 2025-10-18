import 'package:flutter/material.dart';

import '../core/helpers/transaction_helpers.dart';
import '../core/utils/utils.dart';
import 'box_icon_widget.dart';
import 'text_currency_widget.dart';

class ListTileTransactionWidget extends StatelessWidget {
  final String type;
  final String categoryName;
  final String notes;
  final double amount;
  final DateTime date;
  const ListTileTransactionWidget({
    super.key,
    required this.type,
    required this.categoryName,
    required this.notes,
    required this.amount,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: BoxIconWidget(
        backgroundColor: TransactionHelpers.backgroundColor(type),
        color: TransactionHelpers.color(type),
        icon: TransactionHelpers.icon(type),
      ),
      title: Text(categoryName),
      subtitle: Text(notes),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextCurrencyMediumWidget(
            number: amount,
            color: TransactionHelpers.color(type),
          ),

          Text(Utils.formatDate(date)),
        ],
      ),
    );
  }
}
