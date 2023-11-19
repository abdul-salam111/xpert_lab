import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nanoid/nanoid.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../appConst/index.dart';
import '../../../data/index.dart';
import '../../../firebaseServices/index.dart';
import '../../index.dart';

class CartScreenController extends GetxController {
  RxList<AddToCartModel> cartList = <AddToCartModel>[].obs;

  void addToCart(AddToCartModel addToCartModel) {
    cartList.add(addToCartModel);
    Utils.showToast(msg: "Added to the cart", bgcolor: greenColor);
  }

  void removerFromCart(AddToCartModel addToCartModel) {
    cartList.remove(addToCartModel);
  }

  void clearCart() {
    cartList.clear();
  }

  RxInt total_Tests = 0.obs;
  RxDouble total_Bill = 0.0.obs;

  //this data variable gets all the snapshots from cartscreen to calculate all the tests prices
  var user_Name = "".obs;
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var addressController = TextEditingController();
  var date = DateTime.now().obs;
  var startTime = TimeOfDay.now().obs;
  var endTime = TimeOfDay.now().obs;
  var cartData;
  var notificationCount = 0.obs;
  calculateTotalBill() {
    total_Bill.value = 0.0;
    for (int i = 0; i < cartList.length; i++) {
      total_Bill.value =
          total_Bill.value + double.parse(cartList[i].testPrice!);
    }
    return total_Bill.value;
  }

  getUserName() async {
    final SharedPreferences prefer = await prefs;
    user_Name.value = prefer.getString("user_Name")??"";
  }

  @override
  void onInit() async {
    // TODO: implement onReady
    super.onInit();
    getUserName();
  }

  var loading = false.obs;
  RxList<String> testlist = <String>[].obs;
  RxList<String> testPrices = <String>[].obs;
  //test booking from cart
  //test booking
  bookTest({context}) async {
    try {
      final preference = await prefs;
      loading.value = true;
      var testId = await customAlphabet('123456ABXY', 8);
      for (int i = 0; i < cartList.length; i++) {
        testlist.add(cartList[i].testName!);
        testPrices.add(cartList[i].testPrice!);
      }
      TestBooking testBookingModel = TestBooking(
          booked_By_Address: addressController.text.toString(),
          booked_By_Id: currentUser!.uid,
          booked_By_Phone: phoneController.text.toString(),
          bookingDate: date.value.toString(),
          bookingTime:
              "${startTime.value.format(context)} - ${endTime.value.format(context)}",
          gender: preference.getString('user_Gender'),
          testNames: testlist,
          testPrices: testPrices,
          totalBill: total_Bill.value.toString(),
          added_By_Name: nameController.text.toString(),
          testBookingId: testId,
          status: "inProgress",
          dataCreated: DateTime.now());
      await firestore.collection(bookingsCollection).doc(testId).set(
            testBookingModel.toJson(),
          );
      cartList.clear();
      testlist.clear();
      testPrices.clear();
      notificationCount.value = 0;
      Get.put(AlertsController()).notificationCount.value =
          Get.put(AlertsController()).notificationCount.value + 1;

      showNotification(
          title: "Booking confirmed",
          body: "Your booking has been confirmed with xpert lab.");
      loading.value = false;
    } on FirebaseException catch (e) {
      loading.value = false;
      Utils.showToast(msg: e.message!, bgcolor: redColor);
    }
  }
}
