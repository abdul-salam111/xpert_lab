import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../appConst/index.dart';
import '../../../../routes/app_pages.dart';
import '../../../index.dart';

class SignInController extends GetxController {
  // to show or hide the password on password textfield
  RxBool isVisible = true.obs;

  var email = TextEditingController();
  var password = TextEditingController();
  var forgetPasswordEmail = TextEditingController();
  var isLoading = false.obs; //used for loading on the auth screens

  //login method
  Future loginMethod({email, password}) async {
    try {
      isLoading.value = true;
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
      
        currentUser = value.user;
        
      getUserDetails();
        isLoading.value = false;
        Get.offAllNamed(Routes.NAV_BAR);
      });
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      Utils.showToast(bgcolor: redColor, msg: e.toString());
    }
  }

  resetPassword(email) async {
    try {
      isLoading.value = true;
      await auth.sendPasswordResetEmail(email: email).then((value) {
        Utils.showToast(
            msg: "Email sended for password reset, please check!",
            bgcolor: greenColor);
        isLoading.value = false;
        Get.back();
      });
    } catch (e) {
      isLoading.value = false;

      Utils.showToast(msg: e.toString(), bgcolor: redColor);
    }
  }

  @override
  void dispose() {
    password.dispose();
    email.dispose();
    super.dispose();
  }

// method to get userDetails which we will be using accross the app.
  void getUserDetails() async {
    final SharedPreferences prefer = await prefs;
    await firestore
        .collection(userCollection)
        .doc(currentUser!.uid)
        .get()
        .then((value) async {
          print(currentUser!.uid);
      await prefer.setString("user_Name", value['userName'].toString());
      await prefer.setString("phone_Number", value['userPhone'].toString());
      await prefer.setString("user_Gender", value['userGender'].toString());
      await prefer.setString("user_Dob", value['userDob'].toString());
    
    });
  }
}
