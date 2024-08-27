import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foodorder/Common/customTile.dart';
import 'package:foodorder/Common/custom_container.dart';
import 'package:foodorder/Common/custombutton.dart';
import 'package:foodorder/constant/constant.dart';
import 'package:foodorder/controller/loginController.dart';
import 'package:foodorder/controller/userlocationcontroller.dart';
import 'package:foodorder/model/othermodels/loginresponsemodel.dart';
import 'package:foodorder/view/auth/Loginpage.dart';
import 'package:foodorder/view/auth/userinfowidget.dart';
import 'package:foodorder/view/home/address/shippingadress.dart';
import 'package:foodorder/view/profile/profileappbar.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final usercontroller = Get.put(UserLocationController());
    final box = GetStorage();
    Loginresponsemodel? user;
    String? token = box.read('token');
    if (token != null) {
      user = controller.userinfo();
    }
    if (token == null) {
      return const Loginpage();
    }
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.h), child: Profileappbar()),
      body: SafeArea(
          child: CustomContainer(
        cotaincontaainer: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                decoration: const BoxDecoration(
                  color: kwhiteoff,
                ),
                child: Userinfowidget(
                  user: user,
                )),
            Container(
              height: 195.h,
              child: ListView(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  CustomListTile(
                    title: 'My order',
                    leadingIcon: Icons.fastfood_outlined,
                    size: 20,
                    onTap: () {
                      Get.to(() => const Loginpage(),
                          transition: Transition.fadeIn,
                          duration: const Duration(microseconds: 900));
                    },
                    trailing: const Icon(Ionicons.arrow_forward_circle),
                  ),
                  CustomListTile(
                    title: 'My favorite places',
                    leadingIcon: Ionicons.heart_circle_outline,
                    onTap: () {},
                    trailing: const Icon(Ionicons.arrow_forward_circle),
                  ),
                  CustomListTile(
                    title: 'Review',
                    leadingIcon: Ionicons.chatbubble_outline,
                    onTap: () {},
                    trailing: const Icon(Ionicons.arrow_forward_circle),
                  ),
                  CustomListTile(
                    title: 'coupons',
                    leadingIcon: MaterialCommunityIcons.tag,
                    onTap: () {},
                    trailing: const Icon(Ionicons.arrow_forward_circle),
                  )
                ],
              ),
            ),
            Container(
              height: 15.h,
              decoration: const BoxDecoration(color: kwhiteoff),
            ),
            Container(
              height: 180.h,
              child: ListView(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  CustomListTile(
                    title: 'shipping Adress',
                    leadingIcon: SimpleLineIcons.location_pin,
                    onTap: () {
                      Get.to(() => RecordMaps(),
                          transition: Transition.fadeIn,
                          duration: Duration(microseconds: 900));
                    },
                    trailing: const Icon(Ionicons.arrow_forward_circle),
                  ),
                  CustomListTile(
                    title: ' service center',
                    leadingIcon: AntDesign.customerservice,
                    onTap: () {},
                    trailing: const Icon(Ionicons.arrow_forward_circle),
                  ),
                  CustomListTile(
                    title: 'coupons',
                    leadingIcon: MaterialCommunityIcons.tag,
                    onTap: () {},
                    trailing: const Icon(Ionicons.arrow_forward_circle),
                  ),
                  CustomListTile(
                    title: 'Setting',
                    leadingIcon: AntDesign.setting,
                    onTap: () {},
                    trailing: const Icon(Ionicons.arrow_forward_circle),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomButton(
              height: 30.h,
              color: kPrimary,
              width: width,
              onPressed: () {
                controller.logoutfunction();
              },
              child: const Center(
                  child: Text(
                "Logout",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              )),
            )
          ],
        ),
      )),
    );
  }
}
