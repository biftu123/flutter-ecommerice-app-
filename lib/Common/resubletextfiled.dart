import 'package:flutter/material.dart';

class CustomTextFieldInContainer extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget suffixIcon;
  final Widget prefixIcon;
  final String? Function(String?)? validator;

  CustomTextFieldInContainer({
    this.controller,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.suffixIcon = const Icon(Icons.check),
    this.prefixIcon = const Icon(Icons.person),
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        cursorWidth: 2.0, // Adjust the cursor width
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          border: InputBorder.none,
        ),
        validator: validator,
        style: TextStyle(height: 1.0), // Adjust the height of the text field
      ),
    );
  }
}