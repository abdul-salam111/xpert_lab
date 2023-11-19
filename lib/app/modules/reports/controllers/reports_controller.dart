import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:xpert_lab/app/appConst/index.dart';

class ReportsController extends GetxController {
  QueryDocumentSnapshot? queryDocumentSnapshot;

  var selectBookingType = "Simple Reports".obs;
  final List<String> items = [
    'Simple Reports',
    'Package Reports',
  ];
  var showPackage = false.obs;
  getAllSimpleReports() {
    return firestore
        .collection("simpleReports")
        .where("userId", isEqualTo: currentUser!.uid)
        .get();
  }

  getAllPackageReports() {
    return firestore
        .collection("packageReports")
        .where("userId", isEqualTo: currentUser!.uid)
        .get();
  }
}
