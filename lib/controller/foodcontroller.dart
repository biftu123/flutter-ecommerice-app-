import 'package:foodorder/controller/additives.dart';
import 'package:foodorder/model/othermodels/recomdationfoodmodel.dart';
import 'package:get/get.dart';

class Foodcontroller extends GetxController {
  var additivelist = <Additiveobs>[].obs;
  final RxInt count = 1.obs;
  final RxDouble _totalprice = 0.0.obs;
  RxBool intialchecked = false.obs;

  double get totalpricevalue => _totalprice.value;

  set settotatprice(double newvalue) {
    _totalprice.value = newvalue;
  }

  void increment() {
    count.value++;
  }

  void decrement() {
    if (count.value > 1) {
      count.value--;
    }
  }

  void loadingAdditives(List<Additive> additives) {
    additivelist.clear();
    for (var additiveinfo in additives) {
      var additve = Additiveobs(
          title: additiveinfo.title,
          price: additiveinfo.price,
          id: additiveinfo.id,
          Checked: intialchecked.value);
      additivelist.add(additve);
    }
  }

  List<String> getlist() {
    List<String> ads = [];
    for (var additive in additivelist) {
      if (additive.isChecked.value && !ads.contains(additive.title)) {
        ads.add(additive.title);
      } else if (!additive.isChecked.value && ads.contains(additive.title)) {
        ads.remove(additive.title);
      }
    }
    return ads;
  }
   List<String> getcartList() {
    List<String> ads = [];
    for (var additive in additivelist) {
      if (additive.isChecked.value && !ads.contains(additive.title)) {
        ads.add(additive.title);
      } else if (!additive.isChecked.value && ads.contains(additive.title)) {
        ads.remove(additive.title);
      }
    }
    return ads;
  }

  double getTotalPrice() {
    double totalprice = 0.0;
    for (var additiv in additivelist) {
      if (additiv.isChecked.value) {
        totalprice += double.tryParse(additiv.price.toString()) ?? 0.0;
      }
    }
    settotatprice = totalprice;
    return totalprice;
  }
}