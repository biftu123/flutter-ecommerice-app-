import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';

String googleApikey = "";
const kPrimary = Color.fromARGB(186, 3, 245, 204);
const kPrimarylight = Color.fromARGB(255, 189, 240, 233);
const ksecondary = Color.fromARGB(216, 255, 196, 69);
const ksecondaryColorlight = Color.fromARGB(178, 247, 193, 144);
const kteteriayColor = Color.fromARGB(255, 44, 11, 230);
const kgray = Color.fromARGB(255, 173, 179, 178);
const kgerylight = Color.fromARGB(255, 218, 233, 231);
const kdark = Color.fromARGB(255, 15, 15, 15);
const kwhite = Color.fromARGB(255, 255, 255, 255);
const kwhiteoff = Color.fromARGB(255, 246, 248, 248);
const ksecondaryColor = Color.fromARGB(255, 3, 112, 98);
const kred = Color.fromARGB(255, 253, 1, 1);
double height = 825.h;
double width = 375.w;
String baseurl = "http://192.168.100.4:3001";
final List<String> verificationReasons = [
    'To confirm the phone number for order updates and notifications.',
    'Ensure accurate delivery details for the food order.',
    'Prevent order mix-ups and delays by verifying contact information.',
    'Enhance customer service by having a verified contact number for support.',
  ];
