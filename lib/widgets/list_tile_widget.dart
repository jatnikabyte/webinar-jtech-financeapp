import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'box_icon_widget.dart';

class ListTileWidget extends StatelessWidget {
  final Color backgroundColor;
  final Color color;
  final IconData icon;
  final String title;
  final Widget? subtitle;
  final void Function()? onEdit;
  final void Function()? onDelete;

  const ListTileWidget({
    super.key,
    required this.backgroundColor,
    required this.color,
    required this.icon,
    required this.title,
    this.subtitle,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      horizontalTitleGap: 10,
      minLeadingWidth: 0,
      minVerticalPadding: 0,
      leading: BoxIconWidget(
        backgroundColor: backgroundColor,
        color: color,
        icon: icon,
      ),
      title: Text(title, style: Get.textTheme.titleMedium),
      subtitle: subtitle,
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
                onTap: onEdit,
                child: Icon(Icons.edit, size: 18, color: Colors.blue),
              ),
              SizedBox(width: 10),
              InkWell(
                onTap: () {
                  Get.defaultDialog(
                    title: 'Hapus Data',
                    middleText: 'Yakin akan hapus data ini?',
                    textConfirm: 'Hapus',
                    textCancel: 'Batal',
                    confirmTextColor: Colors.white,
                    onConfirm: onDelete,
                  );
                },
                child: Icon(Icons.delete, size: 18, color: Colors.red),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
