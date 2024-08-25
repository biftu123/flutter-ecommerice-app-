import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:foodorder/constant/constant.dart';
import 'package:foodorder/controller/userlocationcontroller.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Customappbar extends StatefulWidget {
  const Customappbar({super.key});

  @override
  State<Customappbar> createState() => _CustomappbarState();
}

class _CustomappbarState extends State<Customappbar> {
  final usercontroller = Get.put(UserLocationController());
  @override
  void initState() {
    _determinePosition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: kwhiteoff,
        height: 110.h,
        child: Container(
          margin: EdgeInsets.only(top: 20.h),
          padding: EdgeInsets.only(right: 10.h, left: 10.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CircleAvatar(
                    radius: 22.h,
                    backgroundColor: ksecondary,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 6.h, left: 15.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "deliver to",
                          style: TextStyle(
                              fontSize: 13,
                              color: ksecondary,
                              fontWeight: FontWeight.w600),
                        ),
                        Obx(() => SizedBox(
                              width: 243.75,
                              child: Text(
                                usercontroller.address == ""
                                    ? " location"
                                    : usercontroller.address,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 11,
                                    color: kgray,
                                    fontWeight: FontWeight.normal),
                              ),
                            ))
                      ],
                    ),
                  )
                ],
              ),
              Text(
                getTimeofDay(),
                style: const TextStyle(fontSize: 35),
              )
            ],
          ),
        ));
  }

  String getTimeofDay() {
    DateTime now = DateTime.now();
    int hour = now.hour;
    if (hour >= 0 && hour < 12) {
      return "☀️";
    } else if (hour >= 12 && hour < 16) {
      return "⛅";
    } else {
      return "🌙";
    }
  }

  /// Determine the current position of the device.R run
  ///
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    _getcurrentlocation();

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
  }

  Future<void> _getcurrentlocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    LatLng currentposition = LatLng(position.longitude, position.latitude);

    usercontroller.setposition(currentposition);

    
    print(currentposition);
  }
}
