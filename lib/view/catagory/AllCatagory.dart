// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodorder/Common/backgroundContainer.dart';
import 'package:foodorder/Common/customshimmer.dart';
import 'package:foodorder/constant/constant.dart';

import 'package:foodorder/model/hooks/allcatagoryHook.dart';
import 'package:foodorder/model/othermodels/allcatagorymodel.dart';
import 'package:foodorder/view/catagory/catagorypage.dart';
import 'package:get/get.dart';

class AllCatagory extends HookWidget {
  const AllCatagory({super.key});

  @override
  Widget build(BuildContext context) {
     final Hookresult = allFetchCatagories();
    List<Allcatagory> catagorylist = Hookresult.data;
    final isloading = Hookresult.isloading;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'all catagories',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.normal, color: kgray),
        ),
        backgroundColor: kwhiteoff,
      ),
      body: isloading?CustomShimmerWidget(height: height,width: width,):Backgroundcontainer(
        color: kwhiteoff,
        child: Container(
          height: height,
          padding: EdgeInsets.only(left: 12.w, top: 10.h),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: List.generate(catagorylist.length, (i) {
              var catagory = catagorylist[i];
              return GestureDetector(
                onTap: () {
                  Get.to(() => const Catagorypage());
                },
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 18.r,
                    backgroundImage: NetworkImage(
                      catagory.imageUrl,
                    ),
                  ),
                  title: Text(
                    catagory.title,
                    style: const TextStyle(
                        fontSize: 14,
                        color: kgray,
                        fontWeight: FontWeight.normal),
                  ),
                  trailing: const Icon(Icons.arrow_outward_outlined),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
