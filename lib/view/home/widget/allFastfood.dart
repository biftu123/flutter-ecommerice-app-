import 'package:flutter/material.dart';
import 'package:foodorder/Common/backgroundContainer.dart';
import 'package:foodorder/constant/constant.dart';
import 'package:foodorder/data/foodlist.dart';

import 'package:foodorder/view/home/widget/foodtile.dart';

class Allfastfood extends StatelessWidget {
  const Allfastfood({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('allfastfood',style: TextStyle(fontSize: 16,color: kgray,fontWeight: FontWeight.normal),),
        centerTitle: true,
        elevation: 0,
      ),
      body:Backgroundcontainer(
            color: kwhiteoff,
            child: ListView(
                scrollDirection: Axis.vertical,
                children: List.generate(foodList.length, (i) {
                  var food = foodList[i];
                  return Foodtile(food:food );
                })))
    );
  }
}