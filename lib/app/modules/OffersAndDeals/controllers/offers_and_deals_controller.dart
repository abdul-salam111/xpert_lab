import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nanoid/nanoid.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xpert_lab/app/firebaseServices/notificationServices.dart';
import 'package:xpert_lab/app/modules/index.dart';
import 'package:xpert_lab/app/routes/app_pages.dart';

import '../../../appConst/index.dart';
import '../../../data/addPackageModel.dart';
import '../../alerts/controllers/alerts_controller.dart';

class OffersAndDealsController extends GetxController {
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var addressController = TextEditingController();
  var date = DateTime.now().obs;
  var startTime = TimeOfDay.now().obs;
  var endTime = TimeOfDay.now().obs;

  RxList<String>? testName = <String>[].obs;
  AddPackageModel? offerDetails;
  QueryDocumentSnapshot? bookedOfferDetails;
  var isloading = false.obs;

  //get All Offers
  getOffersAndDeals() {
    return firestore
        .collection(packageBookings)
        .where("booked_By_Id", isEqualTo: currentUser!.uid)
        .get();
  }

  //this method is used to book package and offers
  bookCompletePackage({context}) async {
    try {
      final preference = await SharedPreferences.getInstance();
      isloading.value = true;
      for (int i = 0; i < offerDetails!.testNames!.length; i++) {
        testName!.add(offerDetails!.testNames![i]);
      }
      var testId = await customAlphabet('123456ABXY', 8);
      await firestore.collection(packageBookings).doc(testId).set({
        "gender": preference.getString('user_Gender')??"Male",
        "booked_By_Id": currentUser!.uid,
        "booked_By_Name": nameController.text.toString(),
        "booked_By_Address": addressController.text.toString(),
        "booked_By_Phone": phoneController.text.toString(),
        "bookingId": testId,
        "package_Name": offerDetails!.packageName,
        "Package_Tests": testName,
        "total_Bill": offerDetails!.discountedPrice,
        "bookingTime":
            "${startTime.value.format(context)} - ${endTime.value.format(context)}",
        "bookingDate": date.toString(),
        "status": "InProgress",
        "dataCreate": DateTime.now()
      });
      testName!.value = <String>[];
      isloading.value = true;
      Get.put(AlertsController()).notificationCount.value =
          Get.put(AlertsController()).notificationCount.value + 1;
      showNotification(
          title: "Booking Done",
          body:
              "Your ${offerDetails!.packageName} Package has been booked with xpert lab.");
      Utils.showToast(msg: "Booking done", bgcolor: greenColor);
      nameController.clear();
      phoneController.clear();
      addressController.clear();
      isloading.value = false;
      Get.offAndToNamed(Routes.NAV_BAR);
    } catch (e) {
      isloading.value = false;
      Utils.showToast(msg: e.toString(), bgcolor: redColor);
    }
  }

  var loading = false.obs;
  cancelBooking({String? orderId}) async {
    try {
      isloading.value = true;
      await firestore.collection(packageBookings).doc(orderId).delete();
      isloading.value = false;
      Get.offAllNamed(Routes.NAV_BAR);
      Utils.showToast(
          msg: "The booking is cancelled successfully", bgcolor: greenColor);
    } catch (e) {
      loading.value = false;
      Utils.showToast(msg: e.toString(), bgcolor: redColor);
    }
  }
}
