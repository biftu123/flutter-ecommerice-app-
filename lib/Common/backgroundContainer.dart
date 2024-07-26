// ignore_for_file: public_member_api_docs, sort_constructors_first, file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:foodorder/constant/constant.dart';

class Backgroundcontainer extends StatelessWidget {
  const Backgroundcontainer({
    super.key,
    required this.child,
    required this.color,
  });
 final  Widget child;
   final  Color color;
  @override
  Widget build(BuildContext context) {
    return Container(width: width, height: height,
 
    decoration:  BoxDecoration(
         color: color,
       borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.r),
        topRight: Radius.circular(20.r)
       ),
       image: const DecorationImage(image: NetworkImage('https://c8.alamy.com/comp/M859J9/harvest-decorative-element-autumn-illustration-with-ribbon-seasonal-M859J9.jpg'),fit: BoxFit.cover,
       opacity: .7)
    ),
    child: child,);
  }
}
