import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodorder/Common/custom_container.dart';
import 'package:foodorder/constant/constant.dart';
import 'package:foodorder/controller/loginController.dart';
import 'package:foodorder/model/othermodels/loginresponsemodel.dart';
import 'package:foodorder/view/auth/Loginpage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Cartpage extends StatelessWidget {
  const Cartpage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final box = GetStorage();
     Loginresponsemodel? user;
    String? token = box.read('token');
    if (token != null) {
      user = controller.userinfo();
    }
    if (token == null) {
      return const  Loginpage();
    }
    return Scaffold(
      backgroundColor: kPrimary,
      appBar:PreferredSize(preferredSize:Size.fromHeight(130.h),
      child:Container(height: 130.h,)),
      body: SafeArea(child: CustomContainer(cotaincontaainer: Container(),)),

    );
  }
}