import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodorder/Common/custom_container.dart';
import 'package:foodorder/Common/customappbar.dart';
import 'package:foodorder/constant/constant.dart';
import 'package:foodorder/view/home/widget/catagorylist.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(110.h),
          child:  SizedBox(
            height: 110.h,
            child:const Customappbar(),
          )),
      body: SafeArea(
        child: CustomContainer(
          cotaincontaainer:const Catagorylist(),
        ),
      ),
    );
  }
}
