import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:xpert_lab/app/modules/cartScreen/controllers/cart_screen_controller.dart';
import 'package:xpert_lab/app/modules/commonWidgets/index.dart';
import 'package:intl/intl.dart';
import '../../../appConst/index.dart';
import '../../../routes/app_pages.dart';
import '../../commonWidgets/reviewTestwidgets.dart';

class CartTestReview extends GetView<CartScreenController> {
  const CartTestReview({super.key});

  @override
  Widget build(BuildContext context) {
    return bgwidget(
      Scaffold(
        bottomNavigationBar: SizedBox(
          height: 40.h,
          child: customButtonRec(
              onPress: () async {
                await controller.bookTest(context: context);
                // ignore: use_build_context_synchronously
                VxDialog.showAlert(context,
                    title: "Booking Done",
                    content: Image.asset(
                      doneicon,
                      height: 50.h,
                      width: 50.h,
                    ),
                    confirmBgColor: greenColor,
                    confirm: "Ok",
                    confirmTextColor: whiteColor, onPressed: () {
                  Get.offAllNamed(Routes.NAV_BAR);
                });
              },
              btnName: confirmBooking,
              textcolor: whiteColor,
              bgColor: darkBlue),
        ),
        backgroundColor: Colors.transparent,
        appBar: customAppBar(titletext: reviewTest),
        body: SafeArea(
          minimum: defaultPadding,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: crossstart,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [benfinfo.text.color(whiteColor).make()],
                      )
                          .box
                          .color(darkBlue)
                          .padding(defaultPadding)
                          .topRounded()
                          .make(),
                      reviewTestwidget(
                          iconname: idcard,
                          title: name,
                          subtitle: controller.nameController.text,
                          subtitlecolor: darkBlue),
                      divider,
                      10.heightBox,
                      Row(children: [
                        Image.asset(
                          reportIcon,
                          height: 30.h,
                          width: 30.h,
                          fit: BoxFit.cover,
                        ),
                        5.widthBox,
                        Column(
                          crossAxisAlignment: crossstart,
                          children: [
                            testname.text
                                .size(13.sp)
                                .fontFamily(regular)
                                .bold
                                .color(darkBlue)
                                .make(),
                            5.heightBox,
                            Column(
                              crossAxisAlignment: crossstart,
                              children: List.generate(
                                  controller.cartList.length,
                                  (index) =>
                                      "${index + 1}) ${controller.cartList[index].testName}  (${controller.cartList[index].testPrice} pkr)"
                                          .text.fontFamily(regular)
                                          .size(8.sp)
                                          .color(darkBlue)
                                          .make()).toList(),
                            ),
                          ],
                        ),
                        5.widthBox,
                      ]).box.padding(defaultPadding).make(),
                      divider,
                      10.heightBox,
                      reviewTestwidget(
                          iconname: house,
                          title: addressforBooking,
                          subtitle: controller.addressController.text,
                          subtitlecolor: darkBlue),
                      divider,
                      10.heightBox,
                      reviewTestwidget(
                          iconname: smartphone,
                          title: "Phone:",
                          subtitle: controller.phoneController.text,
                          subtitlecolor: darkBlue),
                      SizedBox(
                        width: double.infinity,
                        height: 10.h,
                      ).box.bottomRounded().color(darkBlue).make()
                    ],
                  ).box.color(halfwhite).topRounded().make(),
                  20.heightBox,
                  samplecollectionDateAndTime.text.bold
                      .fontFamily(regular)
                      .color(darkBlue)
                      .make(),
                  10.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            calender,
                            width: 25.w,
                            height: 25.h,
                            color: bluesh,
                          ),
                          10.widthBox,
                          DateFormat.yMEd()
                              .format(controller.date.value)
                              .toString()
                              .text
                              .size(13.sp)
                              .color(bluesh)
                              .make()
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                        child: const VerticalDivider(
                          color: darkBlue,
                        ),
                      ),
                      Row(
                        children: [
                          Image.asset(
                            time,
                            width: 25.w,
                            height: 25.h,
                            color: bluesh,
                          ),
                          10.widthBox,
                          "${controller.startTime.value.format(context).toString()} - ${controller.endTime.value.format(context).toString()}"
                              .text
                              .size(13.sp)
                              .color(bluesh)
                              .make()
                        ],
                      ),
                    ],
                  )
                      .box
                      .border(color: bluesh, width: 1)
                      .padding(defaultPadding)
                      .color(halfwhite)
                      .rounded
                      .make(),
                  20.heightBox,
                  Row(
                    children: [
                      paymentMethod.text.make(),
                      5.widthBox,
                      cashonsample.text.color(darkBlue).bold.make()
                    ],
                  ),
                  20.heightBox,
                  Expanded(child: Container()),
                  10.heightBox,
                  Row(
                    children: [
                      totalAmount.text
                          .color(darkBlue)
                          .size(13.sp)
                          .fontFamily(regular)
                          .bold
                          .make(),
                      "Rs. ${controller.total_Bill.value} pkr"
                          .text
                          .color(redColor)
                          .size(15.sp)
                          .bold
                          .fontFamily(regular)
                          .make()
                    ],
                  ),
                  10.heightBox,
                ],
              ),
              Obx(() => loadingWidget(
                  value: controller.loading.value, text: pleasewait)),
            ],
          ),
        ),
      ),
    );
  }
}
