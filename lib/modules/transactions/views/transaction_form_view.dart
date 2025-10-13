import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:webinar/core/enums/transaction_types.dart';
import 'package:webinar/data/models/transaction_model.dart';
import 'package:webinar/modules/transactions/controllers/transaction_controller.dart';
import 'package:webinar/widgets/card_widget.dart';

class TransactionFormView extends StatelessWidget {
  final TransactionModel? transaction;

  const TransactionFormView({super.key, this.transaction});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TransactionController>();
    final isEdit = transaction != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? 'Edit Transaksi' : 'Tambah Transaksi'),
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
                    initialValue: {
                      'date': transaction?.date,
                      'amount': transaction?.amount.toString(),
                      'notes': transaction?.notes,
                      'type': transaction?.type,
                      'categoryId': transaction?.categoryId,
                    },
                    key: controller.formKey,
                    child: Column(
                      children: [
                        FormBuilderDateTimePicker(
                          name: 'date',
                          format: DateFormat('yyyy-MM-dd'),
                          decoration: const InputDecoration(
                            hintText: 'Tanggal',
                          ),
                          inputType: InputType.date,
                          validator: FormBuilderValidators.required(),
                        ),
                        SizedBox(height: 10),
                        FormBuilderTextField(
                          name: 'amount',
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(hintText: 'Total'),
                          validator: FormBuilderValidators.required(),
                        ),
                        SizedBox(height: 10),
                        FormBuilderTextField(
                          name: 'notes',
                          minLines: 3,
                          maxLines: 5,
                          decoration: const InputDecoration(
                            hintText: 'Keterangan',
                          ),
                          validator: FormBuilderValidators.required(),
                        ),
                        SizedBox(height: 10),
                        FormBuilderDropdown(
                          name: 'type',
                          items: [
                            DropdownMenuItem(
                              value: 'expense',
                              child: Text(TransactionType.expense.value),
                            ),
                            DropdownMenuItem(
                              value: 'income',
                              child: Text(TransactionType.income.value),
                            ),
                          ],
                          decoration: const InputDecoration(hintText: 'Tipe'),
                          validator: FormBuilderValidators.required(),
                        ),
                        SizedBox(height: 10),
                        FormBuilderDropdown(
                          name: 'categoryId',
                          items: controller.categories.map((category) {
                            return DropdownMenuItem(
                              value: category.id,
                              child: Row(children: [Text(category.name)]),
                            );
                          }).toList(),
                          decoration: const InputDecoration(
                            hintText: 'Kategori',
                          ),
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
          Padding(
            padding: EdgeInsetsGeometry.all(20),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (isEdit) {
                    controller.updateTransaction(transaction!);
                  } else {
                    controller.addTransaction();
                  }
                },
                child: Text(
                  'Simpan Transaksi',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
