import 'package:flutter/material.dart';
import 'package:foodorder/constant/constant.dart';
import 'package:foodorder/model/othermodels/apierror.dart';
import 'package:foodorder/model/othermodels/recomdationfoodmodel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class searchFoodController extends GetxController {
  final RxBool _isLoading = false.obs;
  bool get isLoadingValue => _isLoading.value;

  void setLoading(bool value) {
    _isLoading.value = value;
  }

  final RxBool _isTrigger = false.obs;
  bool get isTriggervalue => _isTrigger.value;

  void setTrigger(bool value) {
    _isTrigger.value = value;
  }

  List<Recomendationfoodmodel>? searchResult;

  void search(String key) async {
    setLoading(true);
    try {
      final url = '$baseurl/food/search/$key';

      final response = await http.get(Uri.parse(url));
      print(response.statusCode);
      if (response.statusCode == 200) {
        searchResult = recomendationfoodmodelFromJson(response.body);
        
    
      } else {
        apierrorFromJson(response.body);
        // Handle the error response here
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
