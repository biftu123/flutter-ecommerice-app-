

import 'package:get/get.dart';

class Passwordcontroller extends GetxController {
  final RxBool _pass = false.obs;
  bool get passvalue  => _pass.value;
  set setindex(bool newvalue){
    _pass.value = newvalue  ;
  }
}
