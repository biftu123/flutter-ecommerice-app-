import 'package:get/get.dart';

class Foodcontroller extends GetxController {
  final RxInt count = 1.obs;
  void increment() {
    count.value++;
  }
  void decrement() {
    count.value--;
  }
}
