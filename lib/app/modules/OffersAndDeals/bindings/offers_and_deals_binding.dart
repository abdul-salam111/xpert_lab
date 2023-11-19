import 'package:get/get.dart';

import '../controllers/offers_and_deals_controller.dart';

class OffersAndDealsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OffersAndDealsController>(
      () => OffersAndDealsController(),
    );
  }
}
