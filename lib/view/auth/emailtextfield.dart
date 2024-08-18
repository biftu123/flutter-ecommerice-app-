import 'package:flutter/material.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final IconData icon;
  final TextInputType keyboardType;

  EmailTextField({
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.icon,
    this.keyboardType = TextInputType.emailAddress,
  });

  String? _validateEmail(String value) {
    if (value.isEmpty) {
      return 'Email is required';
    }
    // You can add more specific email validation if needed
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: Icon(icon),
        enabledBorder:  const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(9.0))
        ),
        focusedBorder:const  OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
           borderRadius: BorderRadius.all(Radius.circular(9.0))
        ),
        errorBorder:const  OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
           borderRadius: BorderRadius.all(Radius.circular(9.0))
        ),
        focusedErrorBorder:const  OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
           borderRadius: BorderRadius.all(Radius.circular(9.0))
        ),
        disabledBorder:const  OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
           borderRadius: BorderRadius.all(Radius.circular(9.0))
        ),
      ),
      keyboardType: keyboardType,
       validator: (value) => _validateEmail(value!),
    );
  }
}