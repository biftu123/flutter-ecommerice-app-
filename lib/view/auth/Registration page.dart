import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foodorder/Common/custombutton.dart';
import 'package:foodorder/constant/constant.dart';

import 'package:foodorder/controller/registrationcontrol.dart';

import 'package:foodorder/model/othermodels/registratrequst.dart';
import 'package:foodorder/view/auth/Loginpage.dart';
import 'package:foodorder/view/auth/emailtextfield.dart';
import 'package:foodorder/view/auth/passwordtextfield.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Registrationpage extends StatefulWidget {
  const Registrationpage({super.key});

  @override
  State<Registrationpage> createState() => _RegistrationpageState();
}

class _RegistrationpageState extends State<Registrationpage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController username = TextEditingController();
  void dispose() {
    username.dispose();
    email.dispose();
    password.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Registrationcontrol());
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kPrimary,
          centerTitle: true,
          title: const Text(
            ' BIFA FOOD',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          )),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: Container(
              height: 220.h,
              child: Lottie.asset('assets/animation/dlivery.json'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                EmailTextField(
                    controller: username,
                    labelText: 'Username',
                    hintText: 'enter your Username',
                    icon: Ionicons.person_circle),
                SizedBox(
                  height: 10.h,
                ),
                EmailTextField(
                    controller: email,
                    labelText: 'Email',
                    hintText: 'enter your email',
                    icon: Icons.email),
                SizedBox(
                  height: 10.h,
                ),
                Passwordtextfield(
                    controller: password,
                    labelText: 'Password',
                    hintText: 'Enter password',
                    icon: Ionicons.lock_closed_outline),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const Loginpage(),
                            transition: Transition.fadeIn,
                            duration: Duration(microseconds: 900));
                      },
                      child: const Text('All Ready have account? Login',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: kPrimary)),
                    )
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomButton(
                  onPressed: () {
                    if (email.text.isNotEmpty && password.text.isNotEmpty) {
                      Registrationrequstmodel model = Registrationrequstmodel(
                          username: username.text,
                          email: email.text,
                          password: password.text);
                      String data = registrationrequstmodelToJson(model);
                      controller.RegisrationFunction(data);
                    }
                  },
                  height: 30.h,
                  child: const Center(
                    child: Text('s i g n u p',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: kPrimary)),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
