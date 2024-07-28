import 'package:flutter/material.dart';
import 'package:foodorder/Common/backgroundContainer.dart';
import 'package:foodorder/constant/constant.dart';
import 'package:foodorder/data/resturant.dart';
import 'package:foodorder/view/home/widget/resturantTile.dart';

class allnearresturant extends StatelessWidget {
  const allnearresturant({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Resturants',
            style: TextStyle(
                fontSize: 16, color: kgray, fontWeight: FontWeight.normal),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: Backgroundcontainer(
            color: kwhiteoff,
            child: ListView(
                scrollDirection: Axis.vertical,
                children: List.generate(nearbyRestaurants.length, (i) {
                  var restuanta = nearbyRestaurants[i];
                  return Resturanttile(resturant: restuanta);
                }))));
  }
}
