import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodorder/Common/custom_container.dart';
import 'package:foodorder/constant/constant.dart';
import 'package:foodorder/controller/loginController.dart';
import 'package:foodorder/data/foodlist.dart';
import 'package:foodorder/model/hooks/carthooks.dart';
import 'package:foodorder/model/othermodels/cartresponsemodel.dart';
import 'package:foodorder/model/othermodels/loginresponsemodel.dart';
import 'package:foodorder/view/auth/Loginpage.dart';
import 'package:foodorder/view/cart/widget/carttile.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Cartpage extends HookWidget {
  const Cartpage({super.key});

  @override
  Widget build(BuildContext context) {
     final Hookresult = fetchcart();
    List<Cartresponsemodel> Foodlist = Hookresult.data;
    final isloading = Hookresult.isloading;
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
appBar: AppBar(
  title:  const Text("C A R T" ,style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600,color: kdark),),
  centerTitle: true,
  elevation: 0,
), 

      body: SafeArea(child: CustomContainer(cotaincontaainer: Container(
        height: height,
        width :width,
        child: SingleChildScrollView(
          child: Column(children: List.generate(Foodlist.length, (i){
            var food = Foodlist[i];
                    return Carttile(food: food,);

          }),),
        ),

      ),)),

    );
  }
}