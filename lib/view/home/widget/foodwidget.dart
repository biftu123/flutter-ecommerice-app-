// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodorder/constant/constant.dart';

class Foodwidget extends StatelessWidget {
  const Foodwidget({
    super.key,
    required this.name,
    required this.time,
    required this.price,
    required this.image,
    this.ontap,
  });
  final String name;
  final String time;
  final String price;
  final String image;
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
            child: 
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: SizedBox(
                    height: 110.h,
                    width: width*0.7,
                    child: Image.network(image,fit: BoxFit.fitWidth,),
                  ),
                ),
                
              
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 12.w),
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
           
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name,style: const TextStyle(fontSize: 12,color: kdark,fontWeight: FontWeight.w500),),
                         Text(price,style: const TextStyle(fontSize: 9,color: kdark,fontWeight: FontWeight.w500),),
                                    


            ],
           ),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              
              const Text("delivery time",style: TextStyle(fontSize: 12,color: kdark,fontWeight: FontWeight.w500),),
          Text(time,style: const TextStyle(fontSize: 12,color: kdark,fontWeight: FontWeight.w500),),
          

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
