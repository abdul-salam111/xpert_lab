import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:xpert_lab/app/appConst/index.dart';
import 'package:xpert_lab/app/modules/index.dart';

class CartScreenView extends GetView<CartScreenController> {
  const CartScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: customButtonRec(
            onPress: () {
              if (controller.cartList.isNotEmpty) {
                Get.to(() => const CartBooktestView());
              } else {
                Utils.showToast(msg: "Your cart is empty", bgcolor: redColor);
              }

            },
            btnName: proceedtocheckout,
            bgColor: darkBlue,
            textcolor: whiteColor,
            btnSize: Size(double.infinity, 50.h)),
        appBar: AppBar(
          backgroundColor: darkBlue,
          title: const Text(mycart),
          centerTitle: true,

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
        ),
        body: Center(
            child: Padding(
                padding: defaultPadding,
                child: ListView(physics: bouncing, children: [
                  Obx(
                    () => controller.user_Name.value.text
                        .fontFamily(regular)
                        .color(darkBlue)
                        .bold
                        .size(13.sp)
                        .make(),
                  ),
                  10.heightBox,
                  Obx(
                    () => Column(
                      children: [
                        ListView.builder(
                            scrollDirection: Axis.vertical,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.cartList.length,
                            itemBuilder: (context, index) {
                              var data = controller.cartList[index];
                              return ListTile(
                                leading: CircleAvatar(
                                  child: data.testName![0].text
                                      .size(12.sp)
                                      .bold
                                      .make(),
                                ),
                                title: "${data.testName}"
                                    .text
                                    .bold
                                    .size(12.sp)
                                    .maxLines(1)
                                    .make(),
                                subtitle: "${data.testPrice} pkr"
                                    .text
                                    .size(12.sp)
                                    .bold
                                    .color(redColor)
                                    .make(),
                                trailing: IconButton(
                                  onPressed: () {
                                    controller.removerFromCart(data);
                                    controller.notificationCount.value=controller.notificationCount.value-1;
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: redColor,
                                  ),
                                ),
                              )
                                  .box
                                  .roundedSM
                                  .color(halfwhite)
                                  .margin(const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 2))
                                  .make();
                            }),
                        20.heightBox,
                        Obx(
                          () => controller.cartList.isEmpty
                              ? collectionEmpty("It seems the cart is empty")
                              : Row(
                                  mainAxisAlignment: mainspbet,
                                  children: [
                                    "$totalTests${controller.cartList.length}"
                                        .text
                                        .size(12.sp)
                                        .color(darkBlue)
                                        .bold
                                        .make(),
                                    Text(
                                      "$totalAmount ${controller.calculateTotalBill()}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12.sp,
                                          color: darkBlue),
                                    )
                                  ],
                                )
                                  .box
                                  .roundedSM
                                  .color(halfwhite)
                                  .padding(defaultPadding)
                                  .make(),
                        ),
                      ],
                    ),
                  )
                ]))));
  }
}
