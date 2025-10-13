import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardWidget extends StatelessWidget {
  final EdgeInsetsGeometry margin;
  final Widget child;
  const CardWidget({
    super.key,
    this.margin = EdgeInsetsGeometry.zero,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(right: 20, left: 20),
      child: Container(
        padding: EdgeInsets.all(10),
        margin: margin,
        width: Get.width,
        decoration: BoxDecoration(
          color: Colors.white,
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
        child: child,
      ),
    );
  }
}
