import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webinar/core/helpers/transaction_helpers.dart';
import 'package:webinar/core/utils/number_util.dart';
import 'package:webinar/modules/transactions/controllers/transaction_controller.dart';
import 'package:webinar/modules/transactions/views/transaction_form_view.dart';
import 'package:webinar/widgets/card_widget.dart';

import '../../../core/utils/date_util.dart';
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
              child: ListTile(
                contentPadding: EdgeInsets.all(0),
                horizontalTitleGap: 10,
                minLeadingWidth: 0,
                minVerticalPadding: 0,
                leading: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: TransactionHelpers.backgroundColor(transaction.type),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    TransactionHelpers.icon(transaction.type),
                    color: TransactionHelpers.color(transaction.type),
                  ),
                ),
                title: Text(
                  transaction.categoryName,
                  style: Get.textTheme.titleMedium,
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (transaction.notes.isNotEmpty)
                      Text(
                        transaction.notes,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    Text(
                      DateUtil.formatDate(transaction.date),
                      style: Get.textTheme.bodySmall?.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      NumberUtil.formatCurrency(transaction.amount),
                      style: Get.textTheme.titleMedium?.copyWith(
                        color: TransactionHelpers.color(transaction.type),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(
                              () =>
                                  TransactionFormView(transaction: transaction),
                            );
                          },
                          child: Icon(Icons.edit, size: 18, color: Colors.blue),
                        ),
                        SizedBox(width: 10),
                        InkWell(
                          onTap: () {
                            Get.defaultDialog(
                              title: 'Hapus Transaksi',
                              middleText: 'Yakin akan hapus transaksi ini?',
                              textConfirm: 'Hapus',
                              textCancel: 'Batal',
                              confirmTextColor: Colors.white,
                              onConfirm: () {
                                controller.deleteTransaction(transaction.id!);
                                Get.back();
                              },
                            );
                          },
                          child: Icon(
                            Icons.delete,
                            size: 18,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.clearForm();
          Get.to(() => const TransactionFormView());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
