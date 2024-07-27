// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodorder/Common/backgroundContainer.dart';
import 'package:foodorder/constant/constant.dart';
import 'package:foodorder/data/catagory.dart';
import 'package:foodorder/view/catagory/catagorypage.dart';
import 'package:get/get.dart';

class AllCatagory extends StatelessWidget {
  const AllCatagory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'all catagories',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.normal, color: kgray),
        ),
        backgroundColor: kwhiteoff,
      ),
      body: Backgroundcontainer(
        color: kwhiteoff,
        child: Container(
          height: height,
          padding: EdgeInsets.only(left: 12.w, top: 10.h),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: List.generate(foodCategories.length, (i) {
              var catagory = foodCategories[i];
              return GestureDetector(
                onTap: () {
                  Get.to(() => const Catagorypage());
                },
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 18.r,
                    backgroundImage: NetworkImage(
                      catagory['image'],
                    ),
                  ),
                  title: Text(
                    catagory['name'],
                    style: const TextStyle(
                        fontSize: 14,
                        color: kgray,
                        fontWeight: FontWeight.normal),
                  ),
                  trailing: Icon(Icons.arrow_outward_outlined),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
