import 'package:flutter/material.dart';

class TextRow extends StatelessWidget {
  final String text1;
  final String text2;

  TextRow({required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text1),
        Text(text2),
      ],
    );
  }
}