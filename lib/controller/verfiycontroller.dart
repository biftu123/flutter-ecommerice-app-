import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foodorder/constant/constant.dart';
import 'package:foodorder/model/othermodels/apierror.dart';
import 'package:foodorder/model/othermodels/loginresponsemodel.dart';
import 'package:foodorder/view/entrypoint.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class VerifyController extends GetxController {
  final box = GetStorage();
  final RxBool _isLoading = RxBool(false);
  final RxString _otp = ''.obs;

  bool get isLoading => _isLoading.value;
  String get otp => _otp.value;

  void setOtp(String value) => _otp.value = value;

  Future<void> verifyAccount() async {
    _isLoading.value = true;

    try {
      final url = '$baseurl/user/verfiyAccount/$otp';

      final response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${box.read('token')}',
        },
      );

      if (response.statusCode == 200) {
        var data = loginresponsemodelFromJson(response.body);
        String userId = data.id;
        String userdata = jsonEncode(data);
        box.write(userId, userdata);
        box.write('token', data.usertoken);
        box.write('userId', data.id);
        box.write('verfication', data.verificationAccount);
        _isLoading.value = false;
        Get.snackbar(
          'Success',
          'Your account has been verified!',
          backgroundColor: kPrimary,
          snackPosition: SnackPosition.BOTTOM,
        );
        Get.offAll(() => MainScreen(),
            transition: Transition.fadeIn,
            duration: Duration(microseconds: 900));
      } else if (response.statusCode == 400) {
        var error = apierrorFromJson(response.body);
        Get.snackbar(
          'Error',
          error.message,
          backgroundColor: kred,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else if (response.statusCode == 401) {
        Get.snackbar(
          'Error',
          'Unauthorized access. Please login again.',
          backgroundColor: kred,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        // Handle other errors (e.g., 500)
        Get.snackbar(
          'Error',
          'An error occurred. Please try again later.',
          backgroundColor: kred,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar(
        'Error',
        'An error occurred. Please try again later.',
        backgroundColor: kred,
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      _isLoading.value = false;
    }
  }
}
