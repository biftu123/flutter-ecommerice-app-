

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foodorder/constant/constant.dart';

class Profileappbar extends StatelessWidget {
  const Profileappbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
backgroundColor:kwhiteoff ,

   actions:[
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
      onTap:(){},
      child:const Text("🇪🇹",)
        ),
        SizedBox(width: 3.w,),
        Text('ETH'),
         SizedBox(width: 3.w,),
        GestureDetector(
      onTap: (){},
      child: Icon(Ionicons.settings),
        )
        ],
      ),
    )
  
   ]
    );
  }
}