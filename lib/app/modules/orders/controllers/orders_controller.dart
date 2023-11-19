import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:xpert_lab/app/appConst/index.dart';
import 'package:xpert_lab/app/modules/index.dart';

import '../../../routes/app_pages.dart';

class OrdersController extends GetxController {
  DocumentSnapshot? orderDetails;
  var loading = false.obs;
  var selectBookingType="Simple Booking".obs;
  final List<String> items = [
  'Simple Booking',
  'Package Booking',
 
];

  getMyBookings() {
    try {
      return firestore
          .collection(bookingsCollection).orderBy("dataCreated",descending: true)
          .where("booked_By_Id", isEqualTo: currentUser!.uid)
          .snapshots();
    } catch (e) {
      Utils.showToast(msg: e.toString(), bgcolor: redColor);
    }
  }
   getPackageBookings() {
    try {
      return firestore
          .collection(packageBookings).orderBy("dataCreate",descending: true)
          .where("booked_By_Id", isEqualTo: currentUser!.uid)
          .snapshots();
    } catch (e) {
      Utils.showToast(msg: e.toString(), bgcolor: redColor);
    }
  }

  cancelBooking({String? orderId}) async {
    try {
      loading.value = true;
      await firestore.collection(bookingsCollection).doc(orderId).delete();
      loading.value = false;
      Get.offAllNamed(Routes.NAV_BAR);
      Utils.showToast(
          msg: "The booking is cancelled successfully", bgcolor: greenColor);
    } catch (e) {
      loading.value = false;
      Utils.showToast(msg: e.toString(), bgcolor: greenColor);
    }
  }
}
