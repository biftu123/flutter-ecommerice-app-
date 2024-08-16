import 'package:flutter/material.dart';
import 'package:foodorder/constant/constant.dart';

import 'package:phone_otp_verification/phone_verification.dart';

class Phoneverfication extends StatelessWidget {
  const Phoneverfication({super.key});

  @override
  Widget build(BuildContext context) {
    return PhoneVerification(
      isFirstPage: true,
      enableLogo: false,
      themeColor: ksecondaryColor,
      backgroundColor: const Color.fromRGBO(235, 231, 231, 1),
      initialPageText: "Verify Phone Number",
      initialPageTextStyle: const TextStyle(
        color: kPrimary,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      textColor: kPrimary,
      onSend: (String value) {
        print('Phone number: $value');
      },
      onVerification: (String value) {
        print('OTP: $value');
      },
    );
  }
}