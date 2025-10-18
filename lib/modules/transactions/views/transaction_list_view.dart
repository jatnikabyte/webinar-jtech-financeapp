import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/helpers/transaction_helpers.dart';

import '../../../modules/transactions/controllers/transaction_controller.dart';
import '../../../modules/transactions/views/transaction_form_view.dart';
import '../../../widgets/card_widget.dart';

import '../../../core/utils/utils.dart';
import '../../../widgets/list_tile_widget.dart';
import '../../../widgets/no_transaction_yet_widget.dart';

class TransactionListView extends StatelessWidget {
  const TransactionListView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TransactionController());
    return Scaffold(
      appBar: AppBar(title: const Text('Transaksi'), elevation: 0),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.transactions.isEmpty) {
          return NoTransactionYetWidget();
        }
        return ListView.builder(
          padding: EdgeInsets.only(top: 18),
          itemCount: controller.transactions.length,
          itemBuilder: (context, index) {
            final transaction = controller.transactions[index];
            return CardWidget(
              margin: EdgeInsets.symmetric(vertical: 5),

              child: ListTileWidget(
                backgroundColor: TransactionHelpers.backgroundColor(
                  transaction.type,
                ),
                color: TransactionHelpers.color(transaction.type),
                icon: TransactionHelpers.icon(transaction.type),
                title: transaction.notes,
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${Utils.formatCurrency(transaction.amount)} | ${Utils.formatDate(transaction.date)}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                onEdit: () {
                  Get.to(() => TransactionFormView(transaction: transaction));
                },
                onDelete: () {
                  controller.deleteTransaction(transaction.id!);
                  Get.back();
                },
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.clearForm();
          Get.to(() => TransactionFormView());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
