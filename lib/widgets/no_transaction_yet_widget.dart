import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoTransactionYetWidget extends StatelessWidget {
  const NoTransactionYetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.receipt_long_outlined, size: 100, color: Colors.grey),
          const SizedBox(height: 16),
          Text(
            'Belum ada transaksi',
            style: Get.textTheme.titleMedium?.copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
