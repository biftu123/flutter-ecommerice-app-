// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodorder/constant/constant.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Nearresturantwidget extends StatelessWidget {
  const Nearresturantwidget({
    super.key,
    required this.name,
    required this.image,
    required this.logo,
    required this.time,
    required this.address,
    required this.rating,
    this.ontap,
  });
  final String name;
  final String image;
  final String logo;
  final String time;
  final String address;
  final String rating;
final void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Padding(padding: EdgeInsets.only(right: 12.h),
      child:Container(
        width: width*0.75,
        height: 185,
        decoration: BoxDecoration(
          color: kwhite,
          borderRadius: BorderRadius.circular(12.r)
        ),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Padding(padding: EdgeInsets.only(right: 12.h),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: SizedBox(
                    height: 110.h,
                    width: width*0.7,
                    child: Image.network(image,fit: BoxFit.fitWidth,),
                  ),
                ),
                Positioned(
                  right: 10.w,
                  top:10.h,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50.h),
                    child: Container(
                      color: kwhite,
                      child: Padding(padding: EdgeInsets.all(2.h),child: ClipRRect(
                        borderRadius: BorderRadius.circular(50.h),
                        child: Image.network(logo,fit: BoxFit.cover,width: 20.w,height: 20.h,),
                      ),),
                    ),
                  ))
              ],
            ),),
            Padding(padding: EdgeInsets.symmetric(horizontal: 12.w),
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
           Text(name,style: const TextStyle(fontSize: 12,color: kdark,fontWeight: FontWeight.w500),),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                         Text(address,style: const TextStyle(fontSize: 9,color: kdark,fontWeight: FontWeight.w500),),
                                    Text(time,style: const TextStyle(fontSize: 9,color: kdark,fontWeight: FontWeight.w500),),


            ],
           ),
           Row(
            children: [
              RatingBarIndicator(itemCount: 5,
              rating: 5,
              itemSize: 15.h,
                itemBuilder: (BuildContext context, int index) => const Icon(
                Icons.star, color: kPrimary,
              ),
              ),
              Text("$rating +revewu &ratingin",style: const TextStyle(fontSize: 12,color: kdark,fontWeight: FontWeight.w500),),
          

            ],
           )
              ],
            ),)
          ],
        ),
      ) ,),
      
    );
  }
}
