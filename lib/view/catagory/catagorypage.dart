import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodorder/Common/customshimmer.dart';
import 'package:foodorder/constant/constant.dart';
import 'package:foodorder/controller/catagoryController.dart';
import 'package:foodorder/model/hooks/foodsofcatagory.dart';
import 'package:foodorder/model/othermodels/recomdationfoodmodel.dart';
import 'package:foodorder/view/home/widget/foodtile.dart';
import 'package:get/get.dart';


class Catagorypage extends HookWidget {
  const Catagorypage({super.key});

  @override
  Widget build(BuildContext context) {
    final Hookresult = fetchRandmFoodByCatagory('DF001');
    List<Recomendationfoodmodel> Foodlist = Hookresult.data;
    final isloading = Hookresult.isloading;
 final controller = Get.put(Catagorycontroller());
    return Obx( ()=> Scaffold(
      appBar: AppBar(
        title: Text(
          'Explore ${controller.titlevalue} Catagory',
          style: const TextStyle(fontSize: 16, color: kgray, fontWeight: FontWeight.normal),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: isloading
          ? CustomShimmerWidget(width: width * 0.8, height: 70.h)
          : ListView(
              scrollDirection: Axis.vertical,
              children: List.generate(Foodlist.length, (i) {
                final food = Foodlist[i];
                return Foodtile(food: food);
              }),
            ),
    )
 ); }
}