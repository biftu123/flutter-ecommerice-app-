import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foodorder/constant/constant.dart';
import 'package:foodorder/controller/catagoryController.dart';
import 'package:foodorder/model/hooks/resulthooks.dart';
import 'package:foodorder/model/othermodels/apierror.dart';
import 'package:foodorder/model/othermodels/recomdationfoodmodel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

FetchHook fetchRandmFoodByCatagory(String code) {
  final controller = Get.put(Catagorycontroller());
  final catagoriesItem = useState<Recomendationfoodmodel?>(null);
  final isLoading = useState<bool>(false);
  final error = useState<Exception?>(null);
  final apierror = useState<Apierror?>(null);

  Future<void> fetchData() async {
    isLoading.value = true;
    try {
      final url = '$baseurl/food/random/${controller.titlevalue}/$code';
      print('API URL: $url');
      final response = await http.get(Uri.parse(url));
      print(response.statusCode);

      if (response.statusCode == 200) {
        // Parse the response JSON into a Recomendationfoodmodel object
        final Recomendationfoodmodel result = Recomendationfoodmodel.fromJson(response.body as Map<String, dynamic>);
        catagoriesItem.value = result;
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
    data: catagoriesItem.value != null ? [catagoriesItem.value!] : null,
    isloading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}