import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodorder/controller/phoneverficationcontroller.dart';
import 'package:get/get.dart';

class Verificationservice {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final controller = Get.put(VerifyControllerphone());

  Future<void> verifyPhone(String phoneNumber,
      {required Function(String verificationId, int? resendToken) codeSent}) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          controller.verifyAccountphone();
        },
        verificationFailed: (FirebaseException e) {
          // Handle verification failed error
          debugPrint(e.toString());
          // Show an error message to the user
          Get.snackbar('Error', 'Verification failed: ${e.message}');
        },
        codeSent: (String verificationId, int? resendToken) {
          codeSent(verificationId, resendToken);
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          // Handle code auto-retrieval timeout
          debugPrint('Code auto-retrieval timeout');
          // Show a message to the user indicating the timeout
          Get.snackbar('Timeout', 'Verification code retrieval timed out');
        },
      );
    } catch (e) {
      // Handle general errors
      debugPrint(e.toString());
      // Show a generic error message to the user
      Get.snackbar('Error', 'An error occurred during phone verification');
    }
  }

  Future<void> verifySmsCode(String verificationId, String smsCode) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);
      await _auth.signInWithCredential(credential).then((value) {
        controller.verifyAccountphone();
      });
    } catch (e) {
      // Handle errors during SMS code verification
      debugPrint(e.toString());
      // Show an error message to the user
      Get.snackbar('Error', 'SMS code verification failed: ${e.toString()}');
    }
  }
}