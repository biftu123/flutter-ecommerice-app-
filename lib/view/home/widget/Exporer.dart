import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:foodorder/Common/customshimmer.dart';
import 'package:foodorder/constant/constant.dart';
import 'package:foodorder/model/hooks/allfoodhook.dart';


import 'package:foodorder/model/othermodels/recomdationfoodmodel.dart';
import 'package:foodorder/view/home/widget/foodtile.dart';



class Exporer extends HookWidget {
  const Exporer({super.key});

  @override
  Widget build(BuildContext context) {
     final Hookresult = fetchallfoodFood('DF001');
    List<Recomendationfoodmodel> Foodlist = Hookresult.data;
    final isloading = Hookresult.isloading;
    return Scaffold(
      
      body:Container(
            color: kwhiteoff,
            child:isloading?CustomShimmerWidget(width: width * 0.8, height: 70.h): Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                  scrollDirection: Axis.vertical,
                  children: List.generate(Foodlist.length, (i) {
                    var food = Foodlist[i];
                    return Foodtile(food: food);
                  })),
            ))
    );
  }
}