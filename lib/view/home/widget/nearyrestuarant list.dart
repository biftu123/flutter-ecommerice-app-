import 'package:flutter/material.dart';

import 'package:foodorder/data/resturant.dart';
import 'package:foodorder/view/home/widget/nearresturantwidget.dart';

class Nearyrestuarantlist extends StatelessWidget {
  const Nearyrestuarantlist({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(nearbyRestaurants.length, (i) {
          var resturant = nearbyRestaurants[i];
          return Nearresturantwidget(
            name: resturant['name'],
            image: resturant['image'],
            logo: resturant['logo'],
            time: resturant['time'],
            address: resturant['address'],
            rating: resturant['rating'],
          );
        }),
      ),
    );
  }
}
