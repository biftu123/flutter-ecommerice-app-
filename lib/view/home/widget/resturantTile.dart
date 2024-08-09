import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodorder/constant/constant.dart';
import 'package:foodorder/model/othermodels/allresturantmodel.dart';

// ignore: must_be_immutable
class Resturanttile extends StatelessWidget {
  Resturanttile({super.key, required, required this.resturant});
   Allrestuantmodel resturant;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 8.h),
            height: 70,
            width: width * 0.8,
            decoration: BoxDecoration(
                color: kwhite, borderRadius: BorderRadius.circular(9.r)),
            child: Container(
              padding: EdgeInsets.all(4.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(12.r)),
                    child: Stack(
                      children: [
                        SizedBox(
                          width: 70.w,
                          height: 70.h,
                          child: Image.network(resturant.imageUrl),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            padding: EdgeInsets.only(bottom: 2.h, left: 6.w),
                            color: kgray.withOpacity(.6),
                            height: 16.h,
                            width: width * 0.8,
                            child: RatingBarIndicator(
                              itemCount: 5,
                              rating: 5,
                              itemSize: 15.h,
                              itemBuilder: (BuildContext context, int index) =>
                                  const Icon(
                                Icons.star,
                                color: kPrimary,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        resturant.title,
                        style: const TextStyle(
                            fontSize: 12,
                            color: kdark,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        " DelveriyTime :${resturant.time}",
                        style: const TextStyle(
                            fontSize: 9,
                            color: kgray,
                            fontWeight: FontWeight.normal),
                      ),
                      Text(
                        resturant.coords.address,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 9,
                            color: kgray,
                            fontWeight: FontWeight.normal),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(right: 5.w,
          top: 6.h,
            child:Container(
              width: 60.h,
              height: 19.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: resturant.isAvailability== true?kPrimary:kgray,
              ),
              child:resturant.isAvailability== true? const Center(child: Text("Open",style:TextStyle(fontSize: 14,color: kwhiteoff,fontWeight: FontWeight.bold),) ): const Center(child: Text("Closed",style:TextStyle(fontSize: 14,color: kwhiteoff,fontWeight: FontWeight.bold))) ,
            ) )
        ],
      ),
    );
  }
}
