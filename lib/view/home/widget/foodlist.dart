import 'package:flutter/material.dart';
import 'package:foodorder/data/foodlist.dart';
import 'package:foodorder/view/home/widget/foodwidget.dart';

class Foodlist extends StatelessWidget {
  const Foodlist({super.key});

  @override
  Widget build(BuildContext context) {
     return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(foodList.length, (i) {
          var resturant = foodList[i];
          return Foodwidget(name: resturant["name"], time: resturant['time'], price: resturant['price'].toString(), image: resturant['image'],);
        }),
      ),
    ); 
  }
}