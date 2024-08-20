

import 'package:flutter/foundation.dart';
import 'package:foodorder/constant/constant.dart';
import 'package:foodorder/model/othermodels/apierror.dart';

import 'package:foodorder/view/auth/Loginpage.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class Registrationcontrol extends GetxController {
  final RxBool _isLoading = false.obs;
  final box = GetStorage();
  bool get isLoadingValue => _isLoading.value;

  void setLoading(bool value) {
    _isLoading.value = value;
  }

  void RegisrationFunction(String data) async {
    setLoading(true);
    try {
      final url = '$baseurl/auth/create';
      final response = await http.post(Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: data);

      if (response.statusCode == 200) {
        
        Get.snackbar(
            'You are create account in successfully', "Join my food app",
            backgroundColor: kPrimary);
        Get.offAll(() => const Loginpage(),
         transition: Transition.fadeIn,
              duration: Duration(microseconds: 900)
        );
        
      } else {
        var error = apierrorFromJson(response.body);
        Get.snackbar('Registration faild Failed', error.message,
            backgroundColor: kred);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
