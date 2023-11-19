import 'package:get/get.dart';

import '../controllers/test_details_controller.dart';

class TestDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<TestDetailsController>(TestDetailsController());
  }
}
