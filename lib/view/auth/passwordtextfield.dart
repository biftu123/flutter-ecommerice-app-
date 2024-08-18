import 'package:flutter/material.dart';

import 'package:foodorder/controller/passwordcontroller.dart';
import 'package:get/get.dart';

class  Passwordtextfield extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final IconData icon;
  final TextInputType keyboardType;
  
  Passwordtextfield({
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
     final controll = Get.put(Passwordcontroller());
    return Obx(()=>  TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: Icon(icon),
        suffixIcon: controll.passvalue? const Icon(Icons.visibility): const Icon(Icons.visibility_off)
      ),
      keyboardType: keyboardType,
     validator: (value) => _validateEmail(value!),
    ));
  }
}