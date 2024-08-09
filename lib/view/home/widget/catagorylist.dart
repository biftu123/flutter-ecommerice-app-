import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodorder/Common/customshimmer.dart';
import 'package:foodorder/constant/constant.dart';
import 'package:foodorder/controller/catagoryController.dart';

import 'package:foodorder/model/hooks/catagoryHook.dart';
import 'package:foodorder/model/othermodels/catagorymodel.dart';
import 'package:foodorder/view/catagory/AllCatagory.dart';
import 'package:get/get.dart';

class Catagorylist extends HookWidget {
  const Catagorylist({super.key});

  @override
  Widget build(BuildContext context) {
    final Hookresult = useFetchCatagories();
    List<Catagorymodel> catagorylist = Hookresult.data;
    final isloading = Hookresult.isloading;
    //final error = Hookresult.error;
    final controller = Get.put(Catagorycontroller());
    return Container(
      height: 70.h,
      padding: EdgeInsets.only(left: 12.w, top: 10.h),
      child: isloading?CustomShimmerWidget(width: width, height: 70.h): ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(catagorylist.length, (i) {
          var category = catagorylist[i];
          return GestureDetector(
              onTap: () {
                if (controller.catagoryvalue == category.id) {
                  controller.updatecatagory = '';
                  controller.updatemame = '';
                } else if (category.title == 'More') {
                  Get.to(() => const AllCatagory(),
                      transition: Transition.fadeIn,
                      duration: const Duration(microseconds: 900));
                } else {
                  controller.updatecatagory = category.id;
                  controller.updatemame = category.title;
                }
              },
              child: Obx(
                () => Container(
                  margin: EdgeInsets.only(right: 5.w),
                  padding: EdgeInsets.only(top: 4.h),
                  width: width * 0.19,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(
                      color: controller.catagoryvalue == category.id
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
                          category.imageUrl,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Text(
                        category.title,
                        style: const TextStyle(
                          fontSize: 13,
                          color: kgray,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        }),
      ),
    );
  }
}
