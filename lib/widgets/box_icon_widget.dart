import 'package:flutter/material.dart';

class BoxIconWidget extends StatelessWidget {
  final Color color;
  final Color backgroundColor;
  final IconData icon;
  const BoxIconWidget({
    super.key,
    required this.color,
    required this.backgroundColor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icon, color: color),
    );
  }
}
