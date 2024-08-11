import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodorder/constant/constant.dart';
import 'package:foodorder/controller/searchcontroller.dart';

import 'package:foodorder/view/home/widget/foodtile.dart';
import 'package:get/get.dart';

class Searchresult extends StatelessWidget {
  const Searchresult({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(searchFoodController());
    return Obx(()=>Container(
      padding: EdgeInsets.fromLTRB(12.h, 10.h, 12.h, 0),
      height: height,
      child: ListView.builder(
          itemCount: controller.searchResult!.length,
          itemBuilder: (context, i) {
            final food = controller.searchResult![i];
            print(food.category);
            return Foodtile(food: food);
          }),
    ));
  }
}
