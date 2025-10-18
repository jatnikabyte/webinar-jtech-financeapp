import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../modules/category/controllers/category_controller.dart';
import '../../../modules/category/views/category_form_view.dart';

import '../../../widgets/card_widget.dart';
import '../../../widgets/list_tile_widget.dart';
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

        return Obx(
          () => ListView.builder(
            padding: EdgeInsets.only(top: 18),
            itemCount: controller.categories.length,
            itemBuilder: (context, index) {
              final category = controller.categories[index];
              return CardWidget(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: ListTileWidget(
                  backgroundColor: Colors.blue.shade50,
                  color: Colors.blue,
                  icon: Icons.category,
                  title: category.name,
                  onEdit: () {
                    Get.to(() => CategoryFormView(category: category));
                  },
                  onDelete: () {
                    controller.deleteCategory(category.id!);
                    Get.back();
                  },
                ),
              );
            },
          ),
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
