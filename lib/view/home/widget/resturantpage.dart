import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foodorder/Common/custombutton.dart';
import 'package:foodorder/Common/rowtex.dart';
import 'package:foodorder/constant/constant.dart';
import 'package:foodorder/model/othermodels/allresturantmodel.dart';
import 'package:foodorder/view/home/widget/Exporer.dart';
import 'package:foodorder/view/home/widget/menu.dart';
import 'package:get/get.dart';

class Resturantpage extends StatefulWidget {
  final Allrestuantmodel? restunarant;

  const Resturantpage({
    Key? key,
    required this.restunarant,
  }) : super(key: key);

  @override
  State<Resturantpage> createState() => _ResturantpageState();
}

class _ResturantpageState extends State<Resturantpage>
    with TickerProviderStateMixin {
  late TabController _tab = TabController(length: 2, vsync: this);
  @override
  Widget build(BuildContext context, ) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: kwhiteoff,
          body: ListView(
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 230.h,
                    width: width,
                    child: CachedNetworkImage(
                        imageUrl: widget.restunarant!.imageUrl),
                  ),
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: Container(
                      height: 35.h,
                      width: width,
                      decoration: BoxDecoration(
                          color: kPrimary.withOpacity(0.4),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(30.r),
                              bottomRight: Radius.circular(30.r))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RatingBarIndicator(
                              rating: widget.restunarant!.rating.toDouble(),
                              itemCount: 5,
                              itemSize: 30,
                              itemBuilder: (context, i) => const Icon(
                                    Icons.star,
                                    color: ksecondary,
                                    size: 25,
                                  )),
                          CustomButton(
                            onPressed: () {},
                            width: width / 2,
                            color: ksecondary,
                            child: Text('rate resturant'),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      top: 40.h,
                      left: 0,
                      right: 0,
                      child: Container(
                        width: width,
                        padding: EdgeInsets.symmetric(horizontal: 2.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: const Icon(
                                Ionicons.chevron_back_circle,
                                size: 30, // Adjust the size as needed
                                color: kPrimary, // Adjust the color as needed
                              ),
                            ),
                            Text(widget.restunarant!.title),
                            GestureDetector(
                              onTap: () {},
                              child: const Icon(
                                Ionicons.location,
                                size: 30, // Adjust the size as needed
                                color: kPrimary, // Adjust the color as needed
                              ),
                            ),
                          ],
                        ),
                      ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextRow(text1: 'distance from here', text2: "2.75Km"),
                    const SizedBox(
                      height: 3,
                    ),
                    TextRow(text1: 'Estimated time', text2: " 30m"),
                    const SizedBox(
                      height: 3,
                    ),
                    TextRow(text1: 'Estimated price', text2: " 100"),
                  ],
                ),
              ),
              const Divider(
                color: Colors.blue, // Customizing the color of the divider
                thickness: 0.7, // Customizing the thickness of the divider
                // Customizing the end padding of the divider
              ),
              SizedBox(
                height: 25.h,
                child: TabBar(tabs:[
                  Tab(
                    child: SizedBox(
                      width: width/2,
                      child: Center(
                        child: Text('MENU'),
                      ),
                    ),
                  ),
                  Tab(
                    child: SizedBox(
                      width: width/2,
                      child: Center(
                        child: Text('EXPORER'),
                      ),
                    ),
                  ),

                ],
                controller: _tab,
                indicator: BoxDecoration(
                  color: kPrimary,
                  borderRadius: BorderRadius.circular(25.r),
                  
                ),
                labelColor: kwhiteoff,
                labelPadding: EdgeInsets.zero,
                ),
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 8.h),child:SizedBox(
                height: height,
                child: TabBarView(
                  controller: _tab,
                  children:[
                    Menu(id: widget.restunarant!.id,),
                   const Exporer()
                  ] ),
              ),)
              
            ],
          ),
        ));
  }
}
