import 'package:get/get.dart';

import '../controllers/alerts_controller.dart';

class AlertsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AlertsController>(
      () => AlertsController(),
    );
  }
}
