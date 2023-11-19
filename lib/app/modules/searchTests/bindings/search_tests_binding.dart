import 'package:get/get.dart';

import '../controllers/search_tests_controller.dart';

class SearchTestsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchTestsController>(
      () => SearchTestsController(),
    );
  }
}
