
// ignore_for_file: file_names

import 'package:get/get.dart';

class Catagorycontroller extends GetxController {
 final RxString _catagory = ''.obs;
  String get catagoryvalue => _catagory.value;
  set updatecatagory(String value) {
    _catagory.value = value;
  }
  final RxString _name = ''.obs;
  String get namevalue => _catagory.value;
  set updatemame(String value) {
    _name.value = value;
  }
}
