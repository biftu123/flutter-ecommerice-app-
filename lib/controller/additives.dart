import 'package:get/get.dart';

class Additiveobs extends GetxController {
  final String title;
  final double price;
  final String id;
  RxBool isChecked = false.obs;

  Additiveobs({
    required this.title,
    required this.price,
    required this.id,
    bool Checked = false,
  }) {
    isChecked = Checked.obs;
  }


  void toggleChecked() {
    isChecked.value = !isChecked.value;
  }
}