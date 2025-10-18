import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../modules/category/views/category_list_view.dart';
import '../../../modules/dashboard/controllers/dashboard_controller.dart';
import '../../../modules/transactions/views/transaction_list_view.dart';

import '../../../core/enums/transaction_types.dart';
import '../../../widgets/box_balance_widget.dart';
import '../../../widgets/box_summary_widget.dart';
import '../../../widgets/button_widget.dart';
import '../../../widgets/card_widget.dart';
import '../../../widgets/list_tile_transaction_widget.dart';
import '../../../widgets/no_transaction_yet_widget.dart';

class DashboardView extends StatelessWidget {
  DashboardView({super.key});
  final DashboardController controller = Get.put(DashboardController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(children: [_buildGreetings(), _buildSummary()]),
          SizedBox(height: 10),
          _buildRecentTransactions(),
          SizedBox(height: 10),
          _buildButtonAddTransaction(),
          SizedBox(height: 10),
          _buildButtonAddCategory(),
        ],
      ),
    );
  }

  Widget _buildButtonAddTransaction() {
    return ButtonWidget(
      title: 'Tambah Transaksi',
      onTap: () => Get.to(TransactionListView()),
    );
  }

  Widget _buildButtonAddCategory() {
    return ButtonWidget(
      title: 'Tambah Kategori',
      onTap: () => Get.to(CategoryListView()),
      colors: [Colors.green, Colors.green.shade200],
    );
  }

  Widget _buildRecentTransactions() {
    return Obx(
      () => CardWidget(
        child: SizedBox(
          height: 450,
          child: controller.transactions.isEmpty
              ? NoTransactionYetWidget()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Transaksi Terakhir',
                      style: Get.theme.textTheme.bodyLarge,
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: controller.transactions.length,
                        itemBuilder: (context, i) {
                          return ListTileTransactionWidget(
                            amount: controller.transactions[i].amount,
                            type: controller.transactions[i].type,
                            categoryName:
                                controller.transactions[i].categoryName,
                            notes: controller.transactions[i].notes,
                            date: controller.transactions[i].date,
                          );
                        },
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  CardWidget _buildSummary() {
    return CardWidget(
      margin: EdgeInsetsGeometry.only(top: 100),
      child: Column(
        children: [
          Obx(() => BoxBalanceWidget(number: controller.balance.value)),
          SizedBox(height: 10),
          Row(
            children: [
              Obx(
                () => BoxSummaryWidget(
                  icon: TransactionType.income.icon,
                  color: TransactionType.income.color,
                  backgroundColor: Colors.green.shade50,
                  number: controller.totalIncome.value,
                  title: TransactionType.income.value,
                ),
              ),
              SizedBox(width: 10),
              Obx(
                () => BoxSummaryWidget(
                  icon: TransactionType.expense.icon,
                  color: TransactionType.expense.color,
                  backgroundColor: Colors.red.shade50,
                  number: controller.totalExpense.value,
                  title: TransactionType.expense.value,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGreetings() {
    return Container(
      height: 200,
      width: Get.width,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(100),
          bottomRight: Radius.circular(100),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 50, left: 20),
        child: Text(
          'Hai Jatnika!',
          style: Get.theme.textTheme.headlineMedium?.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
