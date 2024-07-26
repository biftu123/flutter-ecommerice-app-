import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodorder/constant/constant.dart';

// ignore: must_be_immutable
class CustomContainer extends StatelessWidget {
CustomContainer({super.key,required this.cotaincontaainer});
  Widget cotaincontaainer;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.75,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50.r),
            bottomRight: Radius.circular(50.r)),
        child: Container(
          width: width,
          color: kwhite,
          child:SingleChildScrollView(
            child: cotaincontaainer,
          ),
        ),
      ),
    );
  }
}
