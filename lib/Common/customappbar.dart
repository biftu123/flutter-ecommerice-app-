import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:foodorder/constant/constant.dart';

class Customappbar extends StatelessWidget {
  const Customappbar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: kwhiteoff,
      height: 110.h,
        child: Container(
      margin: EdgeInsets.only(top: 20.h),
      padding: EdgeInsets.only(right: 10.h,left: 10.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CircleAvatar(
                radius: 22.h,
                backgroundColor: ksecondary,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 6.h, left: 15.h),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "deliver to",
                      style: TextStyle(
                          fontSize: 13,
                          color: ksecondary,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 243.75,
                      child: Text(
                        " location",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 11,
                            color: kgray,
                            fontWeight: FontWeight.normal),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
           Text(
            getTimeofDay(),
            style:  const TextStyle(fontSize: 35),
          )
        ],
      ),
    ));
  }

  String getTimeofDay() {
    DateTime now = DateTime.now();
    int hour = now.hour;
    if (hour >= 0 && hour < 12) {
      return "☀️";
    } else if (hour >= 12 && hour < 16) {
      return "⛅";
    } else {
      return "🌙";
    }
  }
}
