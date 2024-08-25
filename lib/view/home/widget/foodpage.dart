// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'package:foodorder/Common/custombutton.dart';
import 'package:foodorder/Common/resubletextfiled.dart';
import 'package:foodorder/constant/constant.dart';
import 'package:foodorder/controller/foodcontroller.dart';
import 'package:foodorder/controller/loginController.dart';

import 'package:foodorder/model/hooks/getresturantbyid.dart';
import 'package:foodorder/model/othermodels/loginresponsemodel.dart';

import 'package:foodorder/model/othermodels/recomdationfoodmodel.dart';
import 'package:foodorder/view/auth/Loginpage.dart';
import 'package:foodorder/view/auth/phoneverfication.dart';
import 'package:foodorder/view/home/widget/order/order.dart';
import 'package:foodorder/view/home/widget/resturantpage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Foodpage extends StatefulHookWidget {
  const Foodpage({
    super.key,
    required this.food,
  });

  final Recomendationfoodmodel food;

  @override
  State<Foodpage> createState() => _FoodpageState();
}

class _FoodpageState extends State<Foodpage> {
  final controler = Get.put(Foodcontroller());
  TextEditingController prefers = TextEditingController();
  final controller = Get.put(LoginController());
  late GetStorage box;
  Loginresponsemodel? user;
  String? token;

  @override
  void initState() {
    super.initState();
    box = GetStorage();
    token = box.read('token');
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      controler.loadingAdditives(widget.food.additives);
    });
  }

  @override
  Widget build(BuildContext context) {
    final Hookresult = getbyResturantId(widget.food.restaurant);

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
                      if (Hookresult.data != null) {
                        Get.to(() => Resturantpage(
                              restunarant: Hookresult.data,
                            ));
                      } else {
                        // Handle case where data is not available
                        print('Restaurant data not available');
                      }
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
                      Obx(
                        () => Text(
                          " \$ ${(widget.food.price + controler.totalpricevalue) * controler.count.value}",
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: kPrimary),
                        ),
                      )
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
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      )),
                  Obx(
                    () => Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: controler.additivelist.length ?? 0,
                          itemBuilder: (context, index) {
                            final additive = controler.additivelist[index];
                            if (additive == null) {
                              // Handle null additive case (e.g., display an error message)
                              return Container(
                                child: const Text('Additive data missing'),
                              );
                            }

                            return CheckboxListTile(
                              visualDensity: VisualDensity.compact,
                              dense: true,
                              tristate: false,
                              activeColor: ksecondary,
                              hoverColor: ksecondary,
                              contentPadding: EdgeInsets.zero,
                              value: additive
                                  .isChecked.value, // Adjust this if needed
                              // secondary : Text(additive.title ?? ''),
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(additive.title ?? ''),
                                  Text(
                                      '\$${additive.price.toStringAsFixed(2) ?? '0.00'}'),
                                ],
                              ),
                              onChanged: (bool? value) {
                                controler.additivelist[index].toggleChecked();
                                controler.getTotalPrice();
                                // Handle checkbox change
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("quantity",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          )),
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
                                    color: kdark,
                                  ),
                                ),
                              )),
                          GestureDetector(
                            onTap: () {
                              controler.decrement();
                            },
                            child: const Icon(AntDesign.minuscircleo),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  const Text(
                    "preferences",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    height: 50.h,
                    child: CustomTextFieldInContainer(
                      controller: prefers,
                      hintText: 'add your notes',
                      maxline: 3,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    height: 35.h,
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30.r)),
                      color: kPrimary,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
              
              if (token != null) {
  user = controller.userinfo();
} else {
  Get.to(() => Loginpage());
}

if (user != null) {
  if (user!.phoneVerification == false) {
    showverfication(context);
  } else {
    Get.to(() => order());
  }
}
                            },
                            child: const Text(
                              'palace order',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: kdark,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: CircleAvatar(
                              radius: 20.h,
                              backgroundColor: ksecondary,
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

  Future<dynamic> showverfication(BuildContext context) {
    return showModalBottomSheet(
      showDragHandle: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.r),
              topRight: Radius.circular(30.r),
            ),
          ),
          height: 550.h,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "verfication Reasons",
                style: TextStyle(
                    color: kPrimary, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.h,
              ),
              Column(
                children: List.generate(verificationReasons.length, (index) {
                  return ListTile(
                    leading: const Icon(
                      Icons.check_circle_outline,
                      color: kPrimary,
                    ),
                    title: Text(
                      verificationReasons[index],
                      style: const TextStyle(
                        fontSize: 11,
                      ),
                    ),
                  );
                }),
              ),
              CustomButton(
                height: 30.h,
                width: width * 0.75,
                color: kPrimary,
                child: Text('verfiy phonenumber'),
                onPressed: () {
                  Get.to(() => const Phoneverfication());
                },
              )
            ]),
          ),
        );
      },
    );
  }
}
