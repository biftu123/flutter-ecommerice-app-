import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foodorder/Common/custombutton.dart';
import 'package:foodorder/constant/constant.dart';
import 'package:foodorder/view/auth/emailtextfield.dart';
import 'package:foodorder/view/auth/passwordtextfield.dart';
import 'package:lottie/lottie.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  TextEditingController email = TextEditingController();
   TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kPrimary,
          centerTitle: true,
          title: const Text(
            ' BIFA FOOD',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          )),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: Container(
              height: 220.h,
              child: Lottie.asset('assets/Animation/bifa.json'),
            ),
          ),
          
          Padding(padding: EdgeInsets.all(8.h),child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              EmailTextField(controller: email, labelText: 'Email', hintText: 'enter your email', icon: Icons.email),
              SizedBox(height: 5.h,),
              Passwordtextfield(controller: password, labelText: 'Password', hintText: 'Enter password', icon: Ionicons.lock_closed_outline),
               SizedBox(height: 5.h,),
               Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: (){},
                    child: const Text('Register',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: kPrimary)),
                  )
                ],
               ),
               CustomButton(
                onPressed:(){
                  
                } ,
                height: 25,
                child: const Center(child: Text('L o g i n',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: kPrimary)),),
               )
            ],
          ),)
        ],
      ),
    );
  }
}
