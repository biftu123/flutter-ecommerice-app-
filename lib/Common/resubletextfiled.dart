import 'package:flutter/material.dart';
import 'package:foodorder/constant/constant.dart';

class CustomTextFieldInContainer extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final VoidCallback? onEditingComplete;

  CustomTextFieldInContainer({
    this.controller,
    this.hintText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
    this.onEditingComplete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(6.0),
      decoration: BoxDecoration(
        color: kwhiteoff,
        border: Border.all(color: Colors.black,),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        cursorHeight: 2,
        cursorWidth: 2,
        cursorColor: kgray,
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          border: InputBorder.none,
        ),
        validator: validator,
        onEditingComplete: onEditingComplete,
        style:const TextStyle(fontSize: 14,fontWeight: FontWeight.normal),
      ),
    );
  }
}
