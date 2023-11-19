import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:xpert_lab/app/appConst/index.dart';
import 'package:xpert_lab/app/modules/index.dart';
import 'package:xpert_lab/app/routes/app_pages.dart';

class ProfileController extends GetxController {
  var userName = "".obs;
  var usernameController = TextEditingController();
  var usergenderController = TextEditingController();
  var dob = DateTime.now().obs;
  var userphoneNumberController = TextEditingController();

  @override
  void onInit() async {
    // TODO: implement onReady
    super.onInit();
    final pref=await prefs;
    userName.value=pref.getString("user_Name")!;
    await firestore
        .collection(userCollection)
        .doc(currentUser!.uid)
        .get()
        .then((value) {
      usernameController.text=value['userName'];
      usergenderController.text = value['userGender'];
      userphoneNumberController.text = value['userPhone'];
      dob.value = DateTime.parse(value['userDob']);
    });
  }

  void signOutUser() async {
    await auth.signOut().then((value) async {
     
      Get.offAllNamed(Routes.SIGN_IN);
    });
  }

  var isloading = false.obs;
  updateProfile({userName, userGender, userDob, userPhone}) {
    try {
      isloading.value = true;
      firestore.collection(userCollection).doc(currentUser!.uid).update({
        "userName": userName,
        "userGender": userGender,
        "userDob": userDob,
        "userPhone": userPhone,
      });
      isloading.value = false;
      Get.back();
      Utils.showToast(msg: "Profile Updated", bgcolor: greenColor);
    } catch (e) {
      isloading.value = false;
      Utils.showToast(msg: e.toString(), bgcolor: redColor);
    }
  }
}
