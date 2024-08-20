import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foodorder/Common/custombutton.dart';
import 'package:foodorder/constant/constant.dart';
import 'package:foodorder/controller/loginController.dart';
import 'package:foodorder/model/othermodels/loginrequstmodel.dart';
import 'package:foodorder/view/auth/Registration%20page.dart';
import 'package:foodorder/view/auth/emailtextfield.dart';
import 'package:foodorder/view/auth/passwordtextfield.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  void dispose() {
    
    email.dispose();
    password.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimary,
        centerTitle: true,
        title: const Text(
          ' BIFA FOOD',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
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
                    controller: email,
                    labelText: 'Email',
                    hintText: 'enter your email',
                    icon: Icons.email,
                  ),
                  SizedBox(height: 10.h),
                  Passwordtextfield(
                    controller: password,
                    labelText: 'Password',
                    hintText: 'Enter password',
                    icon: Ionicons.lock_closed_outline,
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const Registrationpage(),
                              transition: Transition.fadeIn,
                              duration: const Duration(microseconds: 900));
                        },
                        child: const Text('Register',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: kPrimary)),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  CustomButton(
                    onPressed: () {
                      if (email.text.isNotEmpty && password.text.isNotEmpty) {
                        Loginrequstmodel model = Loginrequstmodel(
                            email: email.text, password: password.text);
                        String data = loginrequstmodelToJson(model);
                        controller.loginFunction(data);
                      }
                    },
                    height: 30.h,
                    child: const Center(
                      child: Text('L o g i n',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: kPrimary)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
