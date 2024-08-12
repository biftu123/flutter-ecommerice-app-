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
       final controller = Get.put(SearchFoodController());

      return Container(
        padding: EdgeInsets.fromLTRB(12.h, 10.h, 12.h, 0),
        height: height,
        child: ListView.builder(
          key: UniqueKey(), // Add a UniqueKey to the ListView.builder
           itemCount: controller.searchResult!.length,
          itemBuilder: (context, index) {
            final food = controller.searchResult![index];
            print(food.category);
            return Foodtile(food: food);
          },
        ),
      );
    
  }
}