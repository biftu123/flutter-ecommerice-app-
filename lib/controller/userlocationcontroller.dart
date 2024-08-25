import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class UserLocationController extends GetxController {
  final Rx<LatLng> _position = LatLng(0, 0).obs;
  LatLng get position => _position.value;
  void setposition(LatLng value) {
    _position.value = value;
    print(_position);
  }

  final RxString _address = ''.obs;
  String get address => _address.value;

  final RxString _postalCode = ''.obs;
  String get postalCode => _postalCode.value;
  void setAddress(String value) => _address.value = value;
  void setPostalCode(String value) => _postalCode.value = value;

  Future<void> fetchAddress(LatLng position) async {
    const googleApiKey = 'AIzaSyD1_6V3EsMR3VwC4X18TESjSwLmB45IJjw'; // Replace with your actual API key
    final url =
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$googleApiKey";

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);

        if (responseBody['results'] != null &&
            responseBody['results'].isNotEmpty) {
          final address = responseBody['results'][0]['formatted_address'];
          setAddress(address);

          final addressComponents =
              responseBody['results'][0]['address_components'];
          for (var component in addressComponents) {
            if (component['types'].contains('postal_code')) {
              setPostalCode(component['long_name']);
              break; // Stop searching once postal code is found
            }
          }
        } else {
          print('No results found in the response');
          // Optionally show a snackbar or update UI with "No results found"
          Get.snackbar(
            "Error",
            "Failed to retrieve address: No results found.",
            snackPosition: SnackPosition.BOTTOM,
          );
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
}