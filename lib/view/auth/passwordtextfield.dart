import 'package:flutter/material.dart';

import 'package:foodorder/controller/passwordcontroller.dart';
import 'package:get/get.dart';

class Passwordtextfield extends StatelessWidget {
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
    this.keyboardType = TextInputType.text,
  });

  String? _validateEmail(String value) {
    if (value.isEmpty && value.length > 8) {
      return 'password must be mort';
    }
    // You can add more specific email validation if needed
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final controll = Get.put(Passwordcontroller());
    return Obx(() => TextFormField(
          controller: controller,
          decoration: InputDecoration(
          
              labelText: labelText,
              hintText: hintText,
              prefixIcon: Icon(icon),
              suffixIcon: GestureDetector(
                  onTap: () {
                    controll.setindex = !controll.passvalue;
                  },
                  child: controll.passvalue
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility)),
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
          obscureText: controll.passvalue,
          keyboardType: keyboardType,
          validator: (value) => _validateEmail(value!),
        ));
  }
}
