import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodorder/Common/custom_container.dart';
import 'package:foodorder/constant/constant.dart';

class Searchpage extends StatelessWidget {
  const Searchpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      appBar:PreferredSize(preferredSize:Size.fromHeight(130.h),child:Container(height: 130.h,)),
      body: SafeArea(child: CustomContainer(cotaincontaainer: Container(),)),

    );
  }
}