import 'dart:convert';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foodorder/constant/constant.dart';
import 'package:foodorder/model/hooks/resturantHook.dart';


import 'package:foodorder/model/othermodels/allresturantmodel.dart';
import 'package:foodorder/model/othermodels/apierror.dart';

import 'package:http/http.dart' as http;
   Resturanthook getbyResturantId(String id) {
  final resturant = useState<Allrestuantmodel?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apierror = useState<Apierror?>(null);

  Future<void> fetchData() async {
    isLoading.value = true;
    try {
      final url = '$baseurl/resturant/$id';
      print('API URL: $url');
      final response = await http.get(Uri.parse(url));
      print(response.statusCode);

      if (response.statusCode == 200) {
        var resturants = jsonDecode(response.body);
        resturant.value = Allrestuantmodel.fromJson(resturants);
      } else {
        apierror.value = apierrorFromJson(response.body);
      }
    } catch (e) {
      if (e is Exception) {
        error.value = e;
      } else {
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

  return Resturanthook(
    data: resturant.value,
    isloading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}
