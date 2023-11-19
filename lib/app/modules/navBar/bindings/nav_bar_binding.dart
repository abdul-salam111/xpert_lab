import 'package:get/get.dart';
import 'package:xpert_lab/app/modules/alerts/controllers/alerts_controller.dart';
import 'package:xpert_lab/app/modules/orders/controllers/orders_controller.dart';
import 'package:xpert_lab/app/modules/reports/controllers/reports_controller.dart';

import '../controllers/nav_bar_controller.dart';

class NavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NavBarController());
    Get.put(AlertsController(),permanent: true);
    Get.put(OrdersController());
    Get.put(ReportsController());
  }
}
