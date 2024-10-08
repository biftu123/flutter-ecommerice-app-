import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodorder/Common/custom_container.dart';
import 'package:foodorder/Common/customshimmer.dart';
import 'package:foodorder/Common/resubletextfiled.dart';
import 'package:foodorder/constant/constant.dart';
import 'package:foodorder/controller/searchcontroller.dart';
import 'package:foodorder/view/search/searchresult.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Searchpage extends StatefulWidget {
  const Searchpage({super.key });

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchFoodController());

    return Obx(() => Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 74.h,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.only(top: 12.h),
          child: CustomTextFieldInContainer(
            controller: _searchController,
            maxline: 1,
            hintText: 'Search for Foods',
            suffixIcon: GestureDetector(
              onTap: () {
                if (!controller.isTriggerValue) {
                  controller.search(_searchController.text);
                  controller.setTrigger(true);
                } else {
                  controller.searchResult = null;
                  controller.setTrigger(false);
                  _searchController.clear();
                }
              },
              child: controller.isTriggerValue
                  ? const Icon(
                  Icons.close_outlined,
                  color: kred,
                )
                  : const Icon(
                  Icons.search_outlined,
                  color: kPrimary,
                ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: controller.isLoadingValue
            ? CustomShimmerWidget(width: width, height: 70.h)
            : controller.searchResult == null
            ? CustomContainer(cotaincontaainer: Container(
              height: 210.h,
           child:    Lottie.asset('assets/animation/dlivery.json')
              
            ),
            
        
        )
            : const Searchresult(),
      ),
    ),
    );
  }
}