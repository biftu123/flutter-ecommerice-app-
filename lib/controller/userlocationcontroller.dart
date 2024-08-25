import 'dart:convert';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class UserLocationController extends GetxController {
  final Rx<LatLng> _position = LatLng(0, 0).obs;
  LatLng get position => _position.value;

  final RxString _address = ''.obs;
  String get address => _address.value;

  final RxString _postalCode = ''.obs;
  String get postalCode => _postalCode.value;

  Future<void> fetchAddress(LatLng position) async {
    final googleApiKey = 'YOUR_GOOGLE_API_KEY';
    final url = "https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$googleApiKey";

    try {
      final response = await http.get(Uri.parse(url));
      
      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        
        if (responseBody['results'] != null && responseBody['results'].isNotEmpty) {
          final address = responseBody['results'][0]['formatted_address'];
          setAddress(address);

          final addressComponents = responseBody['results'][0]['address_components'];
          for (var component in addressComponents) {
            if (component['types'].contains('postal_code')) {
              setPostalCode(component['long_name']);
              break; // Stop searching once postal code is found
            }
          }
        } else {
          print('No results found in the response');
          // Optionally show a snackbar or update UI with "No results found"
        }
      } else {
        throw Exception('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "Failed to retrieve address: ${e.toString()}",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void setAddress(String value) => _address.value = value;
  void setPostalCode(String value) => _postalCode.value = value;
}