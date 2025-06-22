import 'package:flutter/material.dart';
import 'package:todo_app/widgets/custom_icon.dart';

class CustomAppBar extends StatelessWidget {
  String title;
  IconData icon;
  void Function()? onPressed;

  CustomAppBar(
      {super.key, required this.title, required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          CustomIcon(
            onPressed: onPressed,
            icon: icon,
          ),
        ],
      ),
    );
  }
}
