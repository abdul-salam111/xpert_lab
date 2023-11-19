import 'package:get/get.dart';

import '../../../appConst/index.dart';
import '../../Utils/utils.dart';

class AlertsController extends GetxController {
  //this method is used to get data from booking collection for notificatios
  getMyBookings() {
    try {
      return firestore
          .collection(bookingsCollection).orderBy("dataCreated",descending: true)
          .where("booked_By_Id", isEqualTo: currentUser!.uid)
          .get();
    } catch (e) {
      Utils.showToast(msg: e.toString(), bgcolor: redColor);
    }
  }
    var notificationCount=0.obs;
@override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    notificationCount.value=0;
  }
}
