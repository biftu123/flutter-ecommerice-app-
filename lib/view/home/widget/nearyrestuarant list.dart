import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foodorder/Common/customshimmer.dart';
import 'package:foodorder/constant/constant.dart';

import 'package:foodorder/model/hooks/nearresturantHooks.dart';
import 'package:foodorder/model/othermodels/allresturantmodel.dart';
import 'package:foodorder/view/home/widget/nearresturantwidget.dart';
import 'package:foodorder/view/home/widget/resturantpage.dart';
import 'package:get/get.dart';

class Nearyrestuarantlist extends HookWidget {
  const Nearyrestuarantlist({super.key});

  @override
  Widget build(BuildContext context) {
    final Hookresult = fetchNearResturant('BUR123');
    List<Allrestuantmodel> resturantlist = Hookresult.data;
    final isloading = Hookresult.isloading;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: isloading
          ? CustomShimmerWidget(width: width * 0.75, height: 185)
          : Row(
              children: List.generate(resturantlist.length, (i) {
                var resturant = resturantlist[i];
                return Nearresturantwidget(
                  ontap: () {
                    Get.to(() => Resturantpage(
                          restunarant: resturant,
                        ));
                  },
                  name: resturant.title,
                  image: resturant.imageUrl,
                  logo: resturant.logoUrl,
                  time: resturant.time,
                  rating: resturant.ratingCount,
                );
              }),
            ),
    );
  }
}
