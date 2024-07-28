import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodorder/Common/custom_container.dart';
import 'package:foodorder/Common/customappbar.dart';
import 'package:foodorder/Common/Heading.dart';
import 'package:foodorder/constant/constant.dart';
import 'package:foodorder/view/home/widget/Recomdation.dart';
import 'package:foodorder/view/home/widget/allFastfood.dart';
import 'package:foodorder/view/home/widget/allnearresrurant.dart';
import 'package:foodorder/view/home/widget/catagorylist.dart';
import 'package:foodorder/view/home/widget/foodlist.dart';
import 'package:foodorder/view/home/widget/nearyrestuarant%20list.dart';
import 'package:get/get.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(110.h),
          child: SizedBox(
            height: 110.h,
            child: const Customappbar(),
          )),
      body: SafeArea(
        child: CustomContainer(
          cotaincontaainer: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: [
              const Catagorylist(),
              Heading(
                  text: 'Neary by resturant',
                  ontap: () {
                    Get.to(() => const allnearresturant(),
                     transition: Transition.fadeIn,
                    duration: const Duration(microseconds: 900));
                  }),
              const Nearyrestuarantlist(),
              Heading(text: 'Try someting new', ontap: () {
                Get.to(() =>const Recomdation(),
                     transition: Transition.fadeIn,
                    duration: const Duration(microseconds: 900));
              }),
              const Foodlist(),
              Heading(text: 'Fastest food nearest you', ontap: () {
                Get.to(() => const Allfastfood(),
                     transition: Transition.fadeIn,
                    duration: const Duration(microseconds: 900));
              }),
              const Foodlist(),
            ]),
          ),
        ),
      ),
    );
  }
}
