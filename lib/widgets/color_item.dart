import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  ColorItem({
    super.key,
    required this.color,
    this.isActive = false,
  });

  Color color;
  bool isActive;

  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            radius: 28,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 24,
              backgroundColor: color,
            ),
          )
        : CircleAvatar(
            radius: 24,
            backgroundColor: color,
          );
  }
}
