import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget? child;
  final Function()? onPressed;
  final Color color;
  final Color textColor;
  final double width;
  final double height;
  final double borderRadius;

  const CustomButton({
    super.key,
    this.child,
    this.onPressed,
    this.color = Colors.blue,
    this.textColor = Colors.white,
    this.width = double.infinity,
    this.height = 50.0,
    this.borderRadius = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child:  Center(
          child:   child ?? Text(
                  'Button',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
      ),
    );
  }
}