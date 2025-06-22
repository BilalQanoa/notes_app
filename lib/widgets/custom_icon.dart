import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  CustomIcon({
    super.key,
    required this.icon,
    this.onPressed,
  });

  void Function()? onPressed;

  IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
          ),
        ),
      ),
    );
  }
}
