import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../appConst/index.dart';
import '../../../data/addToCart.dart';
import '../../index.dart';

class TestDetailsView extends GetView<TestDetailsController> {
  const TestDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: darkBlue,
          onPressed: () {
            Get.put(CartScreenController()).addToCart(AddToCartModel(
              testName: controller.testDetailsdocument!.testName,
              testPrice: controller.testDetailsdocument!.testPrice,
              added_By_Id: currentUser!.uid,
            ));
          var alrcontrol=Get.put(CartScreenController());
          alrcontrol  .notificationCount.value =
                alrcontrol.notificationCount.value + 1;
          },
          child: const Icon(
            Icons.add_shopping_cart_outlined,
            color: whiteColor,
          ),
        ),
        appBar: AppBar(
          actions: [
            Obx(() => notificationBadge(
                showBadge:
                    Get.put(CartScreenController()).notificationCount.value == 0
                        ? false
                        : true,
                count: Get.put(CartScreenController())
                    .notificationCount
                    .value
                    .toString())),
          ],
          backgroundColor: darkBlue,
          title: controller.testDetailsdocument!.testName
              .toString()
              .text
              .fontFamily(regular)
              .size(13.sp)
              .make(),
          centerTitle: true,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                physics: bouncing,
                child: Padding(
                  padding: padding12,
                  child: Column(
                    crossAxisAlignment: crossstart,
                    children: [
                      testname.text.fontFamily(regular).size(13.sp).bold.make(),
                      5.heightBox,
                      controller.testDetailsdocument!.testName
                          .toString()
                          .text
                          .size(14.sp)
                          .fontFamily(regular)
                          .color(fullgrey)
                          .make(),
                      20.heightBox,
                      Row(
                        children: [
                          testPrice.text
                              .fontFamily(regular)
                              .size(14.sp)
                              .bold
                              .make(),
                          5.widthBox,
                          "Rs. ${controller.testDetailsdocument!.testPrice} pkr"
                              .text
                              .size(14.sp)
                              .fontFamily(regular)
                              .color(redColor)
                              .make(),
                        ],
                      ),
                      20.heightBox,
                      Row(
                        children: [
                          "Reference Range:"
                              .text
                              .fontFamily(regular)
                              .size(14.sp)
                              .bold
                              .make(),
                          5.widthBox,
                          "Rs. ${controller.testDetailsdocument!.referenceRange}"
                              .text
                              .size(14.sp)
                              .fontFamily(regular)
                              .color(redColor)
                              .make(),
                        ],
                      ),
                      20.heightBox,
                      testDuration.text
                          .fontFamily(regular)
                          .size(14.sp)
                          .bold
                          .make(),
                      5.heightBox,
                      "${controller.testDetailsdocument!.turnaroundTime} hours"
                          .text
                          .size(14.sp)
                          .color(fullgrey)
                          .make(),
                      20.heightBox,
                      "Sample Type: "
                          .text
                          .fontFamily(regular)
                          .size(14.sp)
                          .bold
                          .make(),
                      5.heightBox,
                      "${controller.testDetailsdocument!.sampleType}"
                          .text
                          .size(14.sp)
                          .color(fullgrey)
                          .make(),
                      20.heightBox,
                      instructions.text
                          .fontFamily(regular)
                          .size(14.sp)
                          .bold
                          .make(),
                      5.heightBox,
                      "${controller.testDetailsdocument!.sampleCollectionInstruction}"
                          .text
                          .size(14.sp)
                          .color(fullgrey)
                          .fontFamily(regular)
                          .justify
                          .make(),
                      20.heightBox,
                      relevantDiseases.text
                          .size(14.sp)
                          .bold
                          .fontFamily(regular)
                          .make(),
                      5.heightBox,
                      "${controller.testDetailsdocument!.relevantDiseases}"
                          .text
                          .size(14.sp)
                          .justify
                          .color(fullgrey)
                          .make(),
                      20.heightBox,
                      "Description"
                          .text
                          .size(14.sp)
                          .bold
                          .fontFamily(regular)
                          .make(),
                      5.heightBox,
                      "${controller.testDetailsdocument!.testDescription}"
                          .text
                          .size(14.sp)
                          .justify
                          .color(fullgrey)
                          .make()
                    ],
                  ),
                ))));
  }
}
