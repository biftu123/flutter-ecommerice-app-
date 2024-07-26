import 'package:get/get.dart';

class Pageindex extends GetxController {
  final RxInt _tabindex = 0.obs;
  int get tabindex => _tabindex.value;
  set setindex(int newvalue){
    _tabindex.value = newvalue  ;
  }
}
