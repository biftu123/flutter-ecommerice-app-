import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foodorder/constant/constant.dart';
import 'package:foodorder/model/othermodels/apierror.dart';
import 'package:foodorder/model/othermodels/recomdationfoodmodel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
class SearchFoodController extends GetxController {
  final RxBool _isLoading = false.obs;
  bool get isLoadingValue => _isLoading.value;

  void setLoading(bool value) {
    _isLoading.value = value;
  }

  final RxBool _isTrigger = false.obs;
  bool get isTriggerValue => _isTrigger.value;

  void setTrigger(bool value) {
    _isTrigger.value = value;
  }

  List<Recomendationfoodmodel>? searchResult;

  Future<void> search(String key) async {
    setLoading(true);
    try {
      final url = '$baseurl/food/search/$key';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = json.decode(response.body);
        searchResult = jsonResponse.map((data) => Recomendationfoodmodel.fromJson(data)).toList();
        print(searchResult);
      } else {
        final errorResponse = apierrorFromJson(response.body);
        debugPrint('Error: ${errorResponse.message}');
      }
    } catch (e) {
      debugPrint('Exception during search: $e');
    } finally {
      setLoading(false);
    }
  }
}