import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodorder/Common/custombutton.dart';

import 'package:foodorder/constant/constant.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

import '../../controller/verfiycontroller.dart';

class Verficationpage extends StatelessWidget {
  const Verficationpage({Key? key});

  @override
  Widget build(BuildContext context) {
    OtpFieldController otpController = OtpFieldController();
    final controller = Get.put(VerifyController());
    return Scaffold(
      backgroundColor: kwhiteoff,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Verify Account',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: kPrimary),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 220.h,
              child: Lottie.asset('assets/animation/dlivery.json'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Verify Account',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: kPrimary),
                  ),
                  const Text(
                    'First, retrieve the email. If you don\'t see it in your inbox, remember to also check your spam folder for any missed messages.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                        fontSize: 12,
                        color: kgray,
                        fontWeight: FontWeight.normal),
                  ),
                   Center(
                      child: OTPTextField(
                        controller: otpController,
                        length: 6,
                        width: width,
                        textFieldAlignment: MainAxisAlignment.spaceAround,
                        fieldWidth: 45,
                    
                        fieldStyle: FieldStyle.box,
                        outlineBorderRadius: 15,
                        style: TextStyle(fontSize: 17),
                        onChanged: (pin) {
                          controller.setOtp(pin);
                        },
                        onCompleted: (pin) {
                          controller.setOtp(pin);
                        },
                      ),
                    ),
                  
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomButton(
                  
                    onPressed: () {
                      controller.verifyAccount();
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
