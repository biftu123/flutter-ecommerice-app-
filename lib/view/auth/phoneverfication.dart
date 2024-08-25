import 'package:flutter/material.dart';
import 'package:foodorder/constant/constant.dart';
import 'package:foodorder/controller/phoneverficationcontroller.dart';
import 'package:foodorder/service/verficationservice.dart';

import 'package:get/get.dart';
import 'package:phone_otp_verification/phone_verification.dart';

class Phoneverfication extends StatefulWidget {
  const Phoneverfication({Key? key}) : super(key: key); // Corrected constructor

  @override
  State<Phoneverfication> createState() => _PhoneverficationState();
}

class _PhoneverficationState extends State<Phoneverfication> {
  final controller = Get.put(VerifyControllerphone());
  Verificationservice _verificationservice =
      Verificationservice(); // Corrected variable name
  String _verificationId = '';

  @override
  Widget build(BuildContext context) {
    return PhoneVerification(
      isFirstPage: true,
      enableLogo: false,
      themeColor: kPrimary,
      backgroundColor: kwhiteoff,
      initialPageText: "Verify Phone Number",
      initialPageTextStyle: const TextStyle(
        color: kPrimary,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      textColor: kdark,
      onSend: (String value) {
         print(value);
        controller.setphone(value);
        _phoneverfy(value);
        
      },
      onVerification: (String value) {
         print(value);
        _verficationsms(value);
      },
    );
  }

  void _phoneverfy(String phonenumber) async {
    await _verificationservice.verifyPhone(controller.phone,
        codeSent: (String verificationId, int? resendToken) {
      setState(() {
        _verificationId = verificationId;
      });
    });
  }

  void _verficationsms(String code) async {
    await _verificationservice.verifySmsCode(_verificationId, code);
  }
}
