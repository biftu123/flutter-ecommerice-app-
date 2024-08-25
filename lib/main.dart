import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodorder/constant/constant.dart';
import 'package:foodorder/view/entrypoint.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

void main()async { 
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
 
  runApp(const MyApp());}
Widget defaultpage = MainScreen();

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    //Set the fit size (Find your UI design, look at the dimensions of the device screen and fill it in,unit in dp)
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return GetMaterialApp(
          
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
              scaffoldBackgroundColor: kwhiteoff,
              iconTheme: const IconThemeData(color: kdark),
              primarySwatch: Colors.grey),
          home: defaultpage,
        );
      },
      
    );
  }
}
