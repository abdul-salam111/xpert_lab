import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpert_lab/app/appConst/index.dart';
import 'package:xpert_lab/app/modules/index.dart';
import 'package:xpert_lab/app/routes/app_pages.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  var emailController = TextEditingController();
  var additionRemarks = TextEditingController();
  RxDouble rating = 0.0.obs;
  var loading = false.obs;

  submitFeedBackAndRating() async {
    try {
      loading.value = true;
      await firestore.collection("userFeedbackAndRating").doc().set({
        "rated_By_Email": emailController.text.toString(),
        "addition_Remarks": additionRemarks.text.toString(),
        "rating": rating.value,
      });
      Utils.showToast(msg: "Thanks For Your Feedback",bgcolor: greenColor);
      loading.value = false;
      Get.offAllNamed(Routes.NAV_BAR);
    } catch (e) {
      loading.value = false;
      Utils.showToast(msg:e.toString(),bgcolor: redColor);
    }
  }
}
