import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webinar/core/helpers/transaction_helpers.dart';
import 'package:webinar/core/utils/number_util.dart';
import 'package:webinar/modules/category/views/category_list_view.dart';
import 'package:webinar/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:webinar/modules/transactions/views/transaction_list_view.dart';

import '../../../core/enums/transaction_types.dart';
import '../../../core/utils/date_util.dart';
import '../../../widgets/card_widget.dart';
import '../../../widgets/no_transaction_yet_widget.dart';

class DashboardView extends StatelessWidget {
  DashboardView({super.key});
  final DashboardController controller = Get.put(DashboardController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(children: [_buildWave(), _buildSummary()]),
          SizedBox(height: 20),
          _buildRecentTransactions(),
          SizedBox(height: 20),
          _buildButtonAddTransaction(),
          SizedBox(height: 10),
          _buildButtonAddCategory(),
        ],
      ),
    );
  }

  Widget _buildButtonAddTransaction() {
    return GestureDetector(
      onTap: () => Get.to(TransactionListView()),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          height: 50,
          width: Get.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.green, Colors.green.shade300],
            ),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.15),
                blurRadius: 15,
                spreadRadius: 0,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add, color: Colors.white),
              Text(
                'Tambah Transaksi',
                style: Get.theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButtonAddCategory() {
    return GestureDetector(
      onTap: () => Get.to(CategoryListView()),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          height: 50,
          width: Get.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.blue.shade300],
            ),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.15),
                blurRadius: 15,
                spreadRadius: 0,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add, color: Colors.white),
              Text(
                'Tambah Kategori',
                style: Get.theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
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
                      child: Obx(
                        () => ListView.builder(
                          padding: EdgeInsets.zero,
                          itemCount: controller.transactions.length,
                          itemBuilder: (context, i) {
                            return ListTile(
                              leading: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: TransactionHelpers.backgroundColor(
                                    controller.transactions[i].type,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  TransactionHelpers.icon(
                                    controller.transactions[i].type,
                                  ),
                                  color: TransactionHelpers.color(
                                    controller.transactions[i].type,
                                  ),
                                ),
                              ),
                              title: Text(
                                controller.transactions[i].categoryName,
                              ),
                              subtitle: Text(controller.transactions[i].notes),
                              trailing: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    NumberUtil.formatCurrency(
                                      controller.transactions[i].amount,
                                    ),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: TransactionHelpers.color(
                                        controller.transactions[i].type,
                                      ),
                                    ),
                                  ),
                                  Obx(
                                    () => Text(
                                      DateUtil.formatDate(
                                        controller.transactions[i].date,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
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
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.wallet, color: Colors.white),
              ),
              SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Saldo'),
                  Obx(
                    () => Text(
                      NumberUtil.formatCurrency(controller.balance.value),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Flexible(
                child: Container(
                  height: 70,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            TransactionType.income.icon,
                            size: 15,
                            color: TransactionType.income.color,
                          ),
                          Text(TransactionType.income.value),
                        ],
                      ),
                      Obx(
                        () => Text(
                          NumberUtil.formatCurrency(
                            controller.totalIncome.value,
                          ),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 10),
              Flexible(
                child: Container(
                  height: 70,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.red.shade50,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            TransactionType.expense.icon,
                            size: 15,
                            color: TransactionType.expense.color,
                          ),
                          Text(TransactionType.expense.value),
                        ],
                      ),
                      Obx(
                        () => Text(
                          NumberUtil.formatCurrency(
                            controller.totalExpense.value,
                          ),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWave() {
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
