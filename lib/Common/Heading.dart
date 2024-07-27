
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'package:foodorder/constant/constant.dart';

class Heading extends StatelessWidget {
  const Heading({
    Key? key,
    required this.text,
   required this.ontap,
  }) : super(key: key);
  final String text;
   final void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return Container(

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
            child:  Icon(AntDesign.appstore1,color:ksecondary),
          )
        ],
      ),
    );
  }
}
