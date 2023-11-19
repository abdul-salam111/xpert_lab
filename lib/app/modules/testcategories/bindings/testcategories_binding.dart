import 'package:get/get.dart';

import '../controllers/testcategories_controller.dart';

class TestcategoriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<TestcategoriesController>(TestcategoriesController());
  }
}
