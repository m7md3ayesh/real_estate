import 'package:flutter/material.dart';

import '../constants/app_const.dart';

class Button extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  final String text;
  final void Function()? onTap;

  const Button({
    super.key,
    this.width = double.infinity,
    this.height = 50,
    this.borderRadius = 10,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Appconst.primaryColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
