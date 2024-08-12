// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foodorder/Common/custombutton.dart';
import 'package:foodorder/constant/constant.dart';

import 'package:foodorder/model/othermodels/recomdationfoodmodel.dart';
import 'package:foodorder/view/home/widget/resturantpage.dart';
import 'package:get/get.dart';

class Foodpage extends StatelessWidget {
  const Foodpage({
    Key? key,
    required this.food,
  }) : super(key: key);

  final Recomendationfoodmodel food;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Stack(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.r),
                    bottomRight: Radius.circular(30.r),
                  ),
                  child: Container(
                    color: kwhiteoff,
                    width: width,
                    height: 230.h,
                    child: Image.network(
                      food.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  )),
              Positioned(
                left: 12.w,
                top: 40.h,
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(
                    Ionicons.chevron_back_circle,
                    size: 30, // Adjust the size as needed
                    color: kPrimary, // Adjust the color as needed
                  ),
                ),
              ),
              Positioned(
                  right: 12.w,
                  bottom: 10.h,
                  child: CustomButton(
                    onPressed: () {
                      Get.to(() => Resturantpage(
                            id: food.id,
                          ));
                    },
                    width: 150.w,
                    height: 25.h,
                    child: const Text('Open Resturant'),
                  ))
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        food.title,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: kdark),
                      ),
                      Text(
                        " \$ ${food.price.toStringAsFixed(2)}",
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: kPrimary),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    food.description,
                    textAlign: TextAlign.justify,
                    maxLines: 8,
                    style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: kgray),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  SizedBox(
                    height: 15.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                        itemCount: food.foodTags.length,
                        itemBuilder: (context, i) {
                          var tags = food.foodTags[i];
                          return Container(
                            height: 15.h,
                            margin: EdgeInsets.only(right: 5.w),
                            decoration: BoxDecoration(
                                color: kPrimary,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.h))),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.w),
                                child: Text(
                                  tags,style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: kgray)
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  SizedBox(height: 15.h,),
                  const Text(
                        'Additives and Topping ',
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: kdark),
                      ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
