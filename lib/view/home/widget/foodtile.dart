import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:foodorder/constant/constant.dart';
import 'package:foodorder/controller/cartController.dart';
import 'package:foodorder/model/othermodels/cartrequstmodel.dart';
import 'package:foodorder/model/othermodels/recomdationfoodmodel.dart';
import 'package:foodorder/view/home/widget/foodpage.dart';
import 'package:get/get.dart';

class Foodtile extends StatelessWidget {
  final Recomendationfoodmodel food;

  const Foodtile({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    final cartcontroller = Get.put(cartController());
    return GestureDetector(
      onTap: () {
        Get.to(() => Foodpage(food: food));
      },
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 8.h),
            height: 70.h,
            width: 0.8.sw,
            decoration: BoxDecoration(
              color: kwhite,
              borderRadius: BorderRadius.circular(9.r),
            ),
            child: Container(
              padding: EdgeInsets.all(4.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Stack(
                      children: [
                        SizedBox(
                          width: 60.w,
                          height: 60.h,
                          child: Image.network(food.imageUrl),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            padding: EdgeInsets.only(bottom: 2.h, left: 6.w),
                            color: kgray.withOpacity(.6),
                            height: 16.h,
                            width: 0.8.sw,
                            child: RatingBarIndicator(
                              itemCount: 5,
                              rating: 5,
                              itemSize: 15.h,
                              itemBuilder: (context, index) => const Icon(
                                Icons.star,
                                color: kPrimary,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        food.title,
                        style: const TextStyle(
                          fontSize: 12,
                          color: kdark,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Delivery Time: ${food.time}",
                        style: const TextStyle(
                          fontSize: 9,
                          color: kgray,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      SizedBox(
                        width: 0.6.sw,
                        height: 17.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: food.additives.length,
                          itemBuilder: (context, index) {
                            var additive = food.additives[index];
                            return Container(
                              margin: EdgeInsets.only(right: 5.w),
                              decoration: BoxDecoration(
                                color: ksecondary,
                                borderRadius: BorderRadius.circular(9.r),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.all(2.h),
                                  child: Text(
                                    additive.title,
                                    style: const TextStyle(
                                      fontSize: 9,
                                      color: kgray,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 5.w,
            top: 6.h,
            child: Container(
              width: 60.w,
              height: 19.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: kPrimary,
              ),
              child: Center(
                child: Text(
                  food.price.toString(),
                  style: const TextStyle(
                    fontSize: 14,
                    color: kwhiteoff,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 75.w,
            top: 6.h,
            child: GestureDetector(
              onTap: () {
                Cartrequstmodel model = Cartrequstmodel(
                    productId: food.id,
                    quantity: 1,
                    totalPrice: food.price,
                    additives:[]);
                    String cart = cartrequstmodelToJson(model);
                cartcontroller.addcart(cart);
              },
              child: Container(
                width: 30.h,
                height: 30.h,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: ksecondary,
                ),
                child: const Icon(
                  Icons.shopping_cart,
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
