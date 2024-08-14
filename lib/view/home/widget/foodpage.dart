// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foodorder/Common/custombutton.dart';
import 'package:foodorder/Common/resubletextfiled.dart';
import 'package:foodorder/constant/constant.dart';
import 'package:foodorder/controller/foodcontroller.dart';

import 'package:foodorder/model/othermodels/recomdationfoodmodel.dart';
import 'package:foodorder/view/home/widget/resturantpage.dart';
import 'package:get/get.dart';

class Foodpage extends StatefulWidget {
  const Foodpage({
    Key? key,
    required this.food,
  }) : super(key: key);

  final Recomendationfoodmodel food;

  @override
  State<Foodpage> createState() => _FoodpageState();
}

class _FoodpageState extends State<Foodpage> {
  final controler = Get.put(Foodcontroller());
  TextEditingController prefers = TextEditingController();
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
                      widget.food.imageUrl,
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
                            id: widget.food.id,
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
                        widget.food.title,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: kdark),
                      ),
                      Text(
                        " \$ ${widget.food.price.toStringAsFixed(2)}",
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
                    widget.food.description,
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
                        itemCount: widget.food.foodTags.length,
                        itemBuilder: (context, i) {
                          var tags = widget.food.foodTags[i];
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
                                  tags,
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const Text("Additives and Topping",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      )),
                  Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: widget.food.additives.length,
                        itemBuilder: (context, index) {
                          final additive = widget.food.additives[index];

                          return CheckboxListTile(
                            visualDensity: VisualDensity.compact,
                            dense: true,
                            activeColor: kPrimary,
                            contentPadding: EdgeInsets.zero,
                            value: true, // Adjust this if needed
                            // secondary : Text(additive.title ?? ''),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(additive.title),
                                Obx(
                                  () => Text(
                                      '\$${additive.price.toStringAsFixed(2) * controler.count.value}'),
                                )
                              ],
                            ),
                            onChanged: (bool? value) {
                              // Handle checkbox change
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Quantity',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: kdark),
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              controler.increment();
                            },
                            child: const Icon(AntDesign.pluscircleo),
                          ),
                          Obx(() => Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  '${controler.count.value}',
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: kdark),
                                ),
                              )),
                          GestureDetector(
                            onTap: () {
                              controler.decrement();
                            },
                            child: const Icon(AntDesign.minuscircleo),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  const Text("preferences",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      )),
                  SizedBox(
                    height: 15,
                    child: CustomTextFieldInContainer(
                      controller: prefers,
                      hintText: 'add your notes',
                      maxline: 3,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    height: 50.h,
                    width: width,
                    decoration: const BoxDecoration(
                        color: kPrimary,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(
                          onPressed: () {
                            showverfication( context);
                          },
                          child: const Text('place order',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: kdark)),
                        ),
                        CustomButton(
                          onPressed: () {},
                          child: CircleAvatar(
                              backgroundColor: ksecondary,
                              radius: 20.r,
                              child: const Icon(
                                Ionicons.cart,
                              )),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<dynamic> showverfication(BuildContext contex) {
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 500.h,
          );
        });
  }
}
