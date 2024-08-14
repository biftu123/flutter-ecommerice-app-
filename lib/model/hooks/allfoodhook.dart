import 'dart:convert';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foodorder/constant/constant.dart';
import 'package:foodorder/model/hooks/resulthooks.dart';
import 'package:foodorder/model/othermodels/apierror.dart';
import 'package:foodorder/model/othermodels/recomdationfoodmodel.dart';
import 'package:http/http.dart' as http;

// Parse the JSON response into a list of Recomendationfoodmodel objects


FetchHook fetchallfoodFood(String code) {
   final catagoriesItem = useState<List<Recomendationfoodmodel>?>([]);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apierror = useState<Apierror?>(null);

  Future<void> fetchData() async {
    isLoading.value = true;
    try {
      final url = '$baseurl/food/$code';
      print('API URL: $url');
      final response = await http.get(Uri.parse(url));
      print(response.statusCode);

      if (response.statusCode == 200) {
        
               final jsonData = jsonDecode(response.body) as List<dynamic>; // Decode as list
        catagoriesItem.value = jsonData.map((item) => Recomendationfoodmodel.fromJson(item)).toList();
      } else {
        apierror.value = apierrorFromJson(response.body);
      }
    } catch (e) {
      if (e is Exception) {
        error.value = e;
      } else {
        // Handle the case where the error is not an Exception
        print('Error: $e');
      }
    } finally {
      isLoading.value = false;
    }
  }

  useEffect(() {
    fetchData();
    return null;
  }, []);

  void refetch() {
    isLoading.value = true;
    fetchData();
  }

  return FetchHook(
    data: catagoriesItem.value,
    isloading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}