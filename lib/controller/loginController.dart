import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:foodorder/constant/constant.dart';
import 'package:foodorder/model/othermodels/apierror.dart';
import 'package:foodorder/model/othermodels/loginrequstmodel.dart';
import 'package:foodorder/model/othermodels/loginresponsemodel.dart';
import 'package:foodorder/view/auth/verficationpage.dart';
import 'package:foodorder/view/home/homepage.dart';
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

    if (response.statusCode == 201) {
      var responseBody = response.body;
      if (responseBody != null && responseBody.isNotEmpty) {
        var responseData = loginresponsemodelFromJson(responseBody);
        
        if (responseData != null) {
          String userId = responseData.id;
          String userdata = jsonEncode(responseData);
          box.write(userId, userdata);
          box.write('token', responseData.usertoken);
          box.write('userId', responseData.id);
          box.write('verification', responseData.verificationAccount ?? false);

          Get.snackbar('You are logged in successfully', "Join my food app",
              backgroundColor: kPrimary);

          if (responseData.verificationAccount ?? false) {
            Get.to(() => const Verficationpage(),
                transition: Transition.fadeIn,
                duration: const Duration(milliseconds: 900));
          }

          Get.offAll(() => const Homepage(),
              transition: Transition.fadeIn,
              duration: const Duration(milliseconds: 900));
        } else {
          Get.snackbar('Login Failed', 'Unable to parse response data', backgroundColor: kred);
        }
      } else {
        Get.snackbar('Login Failed', 'Empty response body', backgroundColor: kred);
      }
    } else {
      var error = apierrorFromJson(response.body);
      Get.snackbar('Login Failed', error.message , backgroundColor: kred);
    }
  } catch (e) {
    debugPrint(e.toString());
  }
}

  }