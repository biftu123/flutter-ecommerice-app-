
// ignore_for_file: file_names

import 'package:get/get.dart';

class Catagorycontroller extends GetxController {
 final RxString _catagory = ''.obs;
  String get catagoryvalue => _catagory.value;
  set updatecatagory(String value) {
    _catagory.value = value;
  }
  final RxString _title = ''.obs;
  String get titlevalue => _title.value;
  set updattitle(String value) {
    _title.value = value;
  }
}
