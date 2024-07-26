import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodorder/constant/constant.dart';
import 'package:foodorder/controller/catagoryController.dart';
import 'package:foodorder/data/catagory.dart';
import 'package:foodorder/view/catagory/AllCatagory.dart';
import 'package:get/get.dart';

class Catagorylist extends StatefulWidget {
  const Catagorylist({Key? key}) : super(key: key);

  @override
  State<Catagorylist> createState() => _CatagorylistState();
}

class _CatagorylistState extends State<Catagorylist> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Catagorycontroller());
    return Container(
      height: 70.h,
      padding: EdgeInsets.only(left: 12.w, top: 10.h),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(foodCategories.length, (i) {
          var category = foodCategories[i];
          return GestureDetector(
            onTap: () {
              if (controller.catagoryvalue == category['id']) {
                controller.updatecatagory = '';
                controller.updatemame = '';
              } else if (category['name'] == 'More') {
                Get.to(() => const AllCatagory(),
                    transition: Transition.fadeIn,
                    duration: const Duration(microseconds: 900));
              } else {
                controller.updatecatagory = category['id'];
                controller.updatemame = category['name'];
              }
            },
            child: Obx(()=>Container(
              margin: EdgeInsets.only(right: 5.w),
              padding: EdgeInsets.only(top: 4.h),
              width: width * 0.19,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(
                  color: controller.catagoryvalue == category['id']
                      ? ksecondary
                      : kwhiteoff,
                  width: 1.w,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 35.h,
                    child: Image.network(
                      category['image'],
                      fit: BoxFit.contain,
                    ),
                  ),
                  Text(
                    category['name'],
                    style: const TextStyle(
                      fontSize: 13,
                      color: kgray,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),)
          );
        }),
      ),
    );
  }
}
