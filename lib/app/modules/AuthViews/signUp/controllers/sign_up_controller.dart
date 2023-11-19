import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../appConst/index.dart';
import '../../../../data/userModal.dart';
import '../../../../routes/app_pages.dart';
import '../../../index.dart';

class SignUpController extends GetxController {
  SignUpController(); //constructor

  RxBool isVisible =
      true.obs; //to check the password whether it is visible or not
  RxBool isLoading = false.obs;

  //textediting controller
  var name = TextEditingController();
  var email = TextEditingController();
  var phone = TextEditingController();
  var dob = DateTime.now().obs;
  var password = TextEditingController();
  var gender = TextEditingController();

  @override
  void onClose() {
    super.onClose();
    name.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
  }

  // User Sign Up Method
  Future signUp(
      {String? name,
      String? email,
      String? gender,
      String? phoneno,
      String? dob,
      String? password}) async {
    try {
      isLoading.value = true;
      await auth
          .createUserWithEmailAndPassword(
              email: email.toString(), password: password.toString())
          .then((user) async {
            currentUser=user.user;
        Usermodel usermodel = Usermodel(
            userId: user.user!.uid,
            userGender: gender.toString(),
            userName: name.toString(),
            userDob: dob.toString(),
            userEmail: user.user!.email,
            userPhone: phoneno.toString(),
            userPassword: password.toString());
        await firestore
            .collection(userCollection)
            .doc(user.user!.uid)
            .set(usermodel.toJson())
            .then((value) async {
          
          final SharedPreferences prefer = await prefs;
          prefer.setString("user_Name", name.toString());
          prefer.setString("phone_Number", phone.text.toString());
          prefer.setString("user_Gender", gender.toString());
          prefer.setString("user_Dob", dob.toString());
        });
      });
      Get.offAllNamed(Routes.NAV_BAR);
      isLoading.value = false;
    } on FirebaseAuthException catch (e) {
      isLoading.value = false;
      Utils.showToast(msg: e.message!, bgcolor: redColor);
    }
  }
}
