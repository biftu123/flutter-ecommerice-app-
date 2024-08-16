import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foodorder/Common/customshimmer.dart';
import 'package:foodorder/constant/constant.dart';
import 'package:foodorder/model/hooks/foodsofcatagory.dart';
import 'package:foodorder/model/othermodels/recomdationfoodmodel.dart';
import 'package:foodorder/view/home/widget/foodtile.dart';

class FoodCatagoryList extends HookWidget {
  const FoodCatagoryList({super.key}) ;

  @override
  Widget build(BuildContext context) {
    final Hookresult = fetchRandmFoodByCatagory('DF001');
    List<Recomendationfoodmodel> Foodlist = Hookresult.data ;
    final isloading = Hookresult.isloading ;

    return isloading
        ? CustomShimmerWidget(width: width, height: height * 0.8)
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.8, // Adjust the height as needed
              child: ListView(
                scrollDirection: Axis.vertical,
                children: List.generate(Foodlist.length, (i) {
                  final food = Foodlist[i];
                  return Foodtile(food: food);
                }),
              ),
            ),
          );
  }
}