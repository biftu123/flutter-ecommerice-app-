import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:foodorder/constant/constant.dart';
import 'package:foodorder/model/othermodels/apierror.dart';

import 'package:foodorder/model/othermodels/loginresponsemodel.dart';
import 'package:foodorder/view/auth/verficationpage.dart';
import 'package:foodorder/view/entrypoint.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  final RxBool _isLoading = false.obs;
  final box = GetStorage();
  bool get isLoadingValue => _isLoading.value;

  void setLoading(bool value) {
    _isLoading.value = value;
  }

  void loginFunction(String data) async {
    setLoading(true);
    try {
      final url = '$baseurl/auth/login';
      final response = await http.post(Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: data);

      if (response.statusCode == 200) {
        var data = loginresponsemodelFromJson(response.body);
        String userId = data.id;
        String userdata = jsonEncode(data);
        box.write(userId, userdata);
        box.write('token', data.usertoken);
        box.write('userId', data.id);
        box.write('verfication', data.verificationAccount);
        setLoading(false);
        Get.snackbar('You are logged in successfully', "Join my food app",
            backgroundColor: kPrimary);

        if (data.verificationAccount == false) {
          Get.to(() => const Verficationpage(),
              transition: Transition.fadeIn,
              duration: Duration(microseconds: 900));
        } else {
          Get.offAll(() => MainScreen(),
              transition: Transition.fadeIn,
              duration: Duration(microseconds: 900));
        }
      } else {
        var error = apierrorFromJson(response.body);
        Get.snackbar('Login Failed', error.message, backgroundColor: kred);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void logoutfunction() {
    box.erase();
    Get.offAll(() => MainScreen(),
        transition: Transition.fadeIn, duration:const Duration(microseconds: 900));
  }

  Loginresponsemodel? userinfo() {
    String? userId = box.read('userId');
    String? data;
    if (userId != null) {
      data = box.read(userId.toString());
    }
    if (data != null) {
      return loginresponsemodelFromJson(data);
    }
    return null;
  }
}
