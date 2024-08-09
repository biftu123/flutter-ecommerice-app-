import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foodorder/Common/backgroundContainer.dart';
import 'package:foodorder/Common/customshimmer.dart';
import 'package:foodorder/constant/constant.dart';

import 'package:foodorder/model/hooks/allresturantHook.dart';
import 'package:foodorder/model/othermodels/allresturantmodel.dart';
import 'package:foodorder/view/home/widget/resturantTile.dart';

class allnearresturant extends HookWidget {
  const allnearresturant({super.key});

  @override
  Widget build(BuildContext context) {
    final Hookresult = allFetchResturant( 'ABC123');
    List< Allrestuantmodel> resturantlist = Hookresult.data;
    final isloading = Hookresult.isloading;
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
        body: isloading?CustomShimmerWidget(height: height,width: width,):Backgroundcontainer(
            color: kwhiteoff,
            child: ListView(
                scrollDirection: Axis.vertical,
                children: List.generate(resturantlist.length, (i) {
                  var restuanta = resturantlist[i];
                  return Resturanttile(resturant: restuanta);
                }))));
  }
}
