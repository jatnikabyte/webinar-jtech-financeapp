import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import '../../../data/models/category_model.dart';
import '../../../modules/category/controllers/category_controller.dart';
import '../../../widgets/button_widget.dart';

import '../../../widgets/card_widget.dart';

class CategoryFormView extends StatelessWidget {
  final CategoryModel? category;

  const CategoryFormView({super.key, this.category});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    final isEdit = category != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? 'Edit Kategori' : 'Tambah Kategori'),
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          CardWidget(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  FormBuilder(
                    initialValue: {'name': category?.name},
                    key: controller.formKey,
                    child: Column(
                      children: [
                        FormBuilderTextField(
                          name: 'name',
                          decoration: const InputDecoration(hintText: 'Nama'),
                          validator: FormBuilderValidators.required(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          ButtonWidget(
            icon: Icons.save,
            title: 'Simpan Kategori',
            onTap: () {
              if (isEdit) {
                controller.updateCategory(category!);
              } else {
                controller.addCategory();
              }
            },
          ),
        ],
      ),
    );
  }
}
