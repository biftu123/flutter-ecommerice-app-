// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:foodorder/constant/constant.dart';

// ignore: camel_case_types
class Heading extends StatelessWidget {
  const Heading({
    Key? key,
    required this.text,
    this.ontap,
  }) : super(key: key);
  final String text;
   final void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 194,
      padding: EdgeInsets.symmetric(horizontal: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: Text(
              text,
              style: const TextStyle(
                  fontSize: 16, color: kdark, fontWeight: FontWeight.bold),
            ),
          ),
          GestureDetector(
            onTap: ontap,
            child: const Icon(AntDesign.appstore1,),
          )
        ],
      ),
    );
  }
}
