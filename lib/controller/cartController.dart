import 'package:flutter/material.dart';
import 'package:foodorder/constant/constant.dart';
import 'package:foodorder/model/othermodels/apierror.dart';
import 'package:foodorder/model/othermodels/cartrequstmodel.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class cartController extends GetxController {
  final RxBool _isLoading = false.obs;
  final box = GetStorage();
  bool get isLoadingValue => _isLoading.value;

  void setLoading(bool value) {
    _isLoading.value = value;
  }

  void addcart(String cart) async {
    _isLoading.value = true;

    try {
      final url = '$baseurl/cart/create';

      final response = await http.post(Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ${box.read('token')}',
          },
          body: cart);
      print(response.statusCode);
      if (response.statusCode == 200) {
        var data = cartrequstmodelFromJson(response.body);

        _isLoading.value = false;
        Get.snackbar(
          'Success',
          'You are add successfully !!!',
          backgroundColor: kPrimary,
          snackPosition: SnackPosition.BOTTOM,
        );
        Get.back();
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
          'Unauthorized access. Please add cart.',
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

  void removecart(String productid) async {
    _isLoading.value = true;

    try {
      final url = '$baseurl/cart/delete/$productid';

      final response = await http.delete(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${box.read('token')}',
        },
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        var data = cartrequstmodelFromJson(response.body);

        _isLoading.value = false;
        Get.snackbar(
          'Success',
          'You are delete successfully !!!',
          backgroundColor: kPrimary,
          snackPosition: SnackPosition.BOTTOM,
        );
        Get.back();
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
          'Unauthorized access. Please add cart.',
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
