import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodorder/Common/customshimmer.dart';
import 'package:foodorder/constant/constant.dart';


import 'package:foodorder/model/hooks/recomendationfoodHook.dart';
import 'package:foodorder/model/othermodels/recomdationfoodmodel.dart';
import 'package:foodorder/view/home/widget/foodpage.dart';
import 'package:foodorder/view/home/widget/foodwidget.dart';
import 'package:get/get.dart';

class Foodlist extends HookWidget {
  const Foodlist({super.key});

  @override
  Widget build(BuildContext context) {
    final Hookresult = fetchRecomendationFood('DF001');
    List<Recomendationfoodmodel> Foodlist = Hookresult.data;
    final isloading = Hookresult.isloading;
     return isloading?CustomShimmerWidget(width: width * 0.8, height: 70.h):Padding(
       padding: const EdgeInsets.all(8.0),
       child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(Foodlist.length, (i) {
            var resturant = Foodlist[i];
            return Foodwidget(name: resturant.title, time: resturant.time, price: resturant.price.toString(), image: resturant.imageUrl,ontap: (){
               Get.to(() => Foodpage(
              food: resturant,
            ));
            },);
          }),
        ),
           ),
     ); 
  }
}