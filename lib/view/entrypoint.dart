import 'package:flutter/material.dart';
import 'package:foodorder/constant/constant.dart';
import 'package:foodorder/controller/pageindex.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foodorder/view/cart/cartpage.dart';
import 'package:foodorder/view/home/homepage.dart';
import 'package:foodorder/view/profile/profilepage.dart';
import 'package:foodorder/view/search/searchpage.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  List<Widget> pageList = [
   const Homepage(),
    const Cartpage(),
   const Searchpage(),
  const  Profilepage(),
  ];
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Pageindex());
    return Obx(() => Scaffold(
          body: Stack(
            children: [
             pageList[controller.tabindex],
              Align(
                alignment: Alignment.bottomCenter,
                child: Theme(
                    data: Theme.of(context).copyWith(canvasColor: kPrimary),
                    child: BottomNavigationBar(
                        showSelectedLabels: false,
                        showUnselectedLabels: false,
                        unselectedIconTheme: const IconThemeData(color: kdark),
                        selectedIconTheme:
                            const IconThemeData(color: ksecondary),
                        onTap: (value) {
                          controller.setindex = value;
                        },
                        currentIndex: controller.tabindex,
                        items: [
                          BottomNavigationBarItem(
                              icon: controller.tabindex == 0
                                  ? const Icon(AntDesign.appstore1)
                                  : const Icon(AntDesign.appstore_o),
                              label: 'home'),
                          const BottomNavigationBarItem(
                              icon: Icon(Icons.search), label: 'search'),
                          const BottomNavigationBarItem(
                              icon: Badge(
                                  label: Text('1'),
                                  child: Icon(FontAwesome.opencart)),
                              label: 'shoping'),
                          BottomNavigationBarItem(
                              icon: controller.tabindex == 3
                                  ? Icon(FontAwesome.user_circle)
                                  : Icon(FontAwesome.user_circle_o),
                              label: "person")
                        ])),
              )
            ],
          ),
        ));
  }
}
