import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../modules/category/controllers/category_controller.dart';
import '../../../modules/category/views/category_form_view.dart';

import '../../../widgets/card_widget.dart';
import '../../../widgets/no_transaction_yet_widget.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());

    return Scaffold(
      appBar: AppBar(title: const Text('Categories'), elevation: 0),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.categories.isEmpty) {
          return NoTransactionYetWidget();
        }

        return ListView.builder(
          padding: EdgeInsets.only(top: 18),
          itemCount: controller.categories.length,
          itemBuilder: (context, index) {
            final transaction = controller.categories[index];
            return CardWidget(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: ListTile(
                contentPadding: EdgeInsets.all(0),
                horizontalTitleGap: 10,
                minLeadingWidth: 0,
                minVerticalPadding: 0,
                title: Text(transaction.name, style: Get.textTheme.titleMedium),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Get.to(
                              () => CategoryFormView(category: transaction),
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
                                controller.deleteCategory(transaction.id!);
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
          Get.to(() => const CategoryFormView());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
