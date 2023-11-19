import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:xpert_lab/app/appConst/index.dart';
import 'package:xpert_lab/app/routes/app_pages.dart';
import '../../index.dart';

class BookedPackagesDetails extends GetView<OffersAndDealsController> {
  const BookedPackagesDetails({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: darkBlue,
          title: const Text("Booking details"),
          centerTitle: true,
        ),
        body: Padding(
          padding: defaultPadding,
          child: Stack(
            children: [
              Column(
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: mainspbet,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                idcard,
                                height: 30.h,
                                width: 30.w,
                                color: darkBlue,
                              ),
                              10.widthBox,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  bookingId.text
                                      .size(12.sp)
                                      .color(bluesh)
                                      .make(),
                                  2.heightBox,
                                  "${controller.bookedOfferDetails!['bookingId']}"
                                      .text
                                      .size(12.sp)
                                      .color(darkBlue)
                                      .fontFamily(regular)
                                      .bold
                                      .make()
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                calender,
                                height: 30.h,
                                width: 30.w,
                                color: lightBlue,
                              ),
                              10.widthBox,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  bookingDate.text
                                      .size(12.sp)
                                      .color(bluesh)
                                      .make(),
                                  2.heightBox,
                                  DateFormat.yMEd()
                                      .format(DateTime.parse(controller
                                          .bookedOfferDetails!['bookingDate']))
                                      .text
                                      .size(12.sp)
                                      .color(darkBlue)
                                      .fontFamily(regular)
                                      .bold
                                      .make()
                                ],
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  const Divider(
                    color: darkBlue,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                profileIcon,
                                height: 30.h,
                                width: 30.w,
                                color: darkBlue,
                              ),
                              10.widthBox,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  "Benficiary Name:"
                                      .text
                                      .size(12.sp)
                                      .color(bluesh)
                                      .make(),
                                  2.heightBox,
                                  "${controller.bookedOfferDetails!['booked_By_Name']}"
                                      .text
                                      .color(darkBlue)
                                      .size(12.sp)
                                      .fontFamily(regular)
                                      .bold
                                      .make()
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                status,
                                height: 30.h,
                                width: 30.w,
                                color: lightBlue,
                              ),
                              10.widthBox,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  "Test Status:"
                                      .text
                                      .size(12.sp)
                                      .color(bluesh)
                                      .make(),
                                  2.heightBox,
                                  "${controller.bookedOfferDetails!['status']}"
                                      .text
                                      .size(12.sp)
                                      .color(darkBlue)
                                      .fontFamily(regular)
                                      .bold
                                      .make()
                                ],
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  10.heightBox,
                  Row(
                    children: [
                      Image.asset(
                        smartphone,
                        height: 25.h,
                        width: 25.w,
                      ),
                      5.widthBox,
                      "Phone: "
                          .text
                          .size(12.sp)
                          .color(bluesh)
                          .fontFamily(regular)
                          .make(),
                      5.widthBox,
                      "${controller.bookedOfferDetails!['booked_By_Phone']}"
                          .text
                          .size(12.sp)
                          .color(darkBlue)
                          .fontFamily(regular)
                          .bold
                          .make(),
                    ],
                  )
                      .box
                      .border(color: darkBlue)
                      .padding(defaultPadding)
                      .roundedSM
                      .make(),
                  10.heightBox,
                  Row(
                    children: [
                      Image.asset(
                        house,
                        height: 25.h,
                        width: 25.w,
                      ),
                      5.widthBox,
                      "Address: "
                          .text
                          .size(12.sp)
                          .color(bluesh)
                          .fontFamily(regular)
                          .make(),
                      5.widthBox,
                      "${controller.bookedOfferDetails!['booked_By_Address']}"
                          .text
                          .size(12.sp)
                          .color(darkBlue)
                          .fontFamily(regular)
                          .bold
                          .make(),
                    ],
                  )
                      .box
                      .border(color: darkBlue)
                      .padding(defaultPadding)
                      .roundedSM
                      .make(),
                  20.heightBox,
                  Row(
                    children: [
                      Image.asset(
                        reportIcon,
                        height: 25.h,
                        width: 25.w,
                      ),
                      10.widthBox,
                      Column(
                        crossAxisAlignment: crossstart,
                        children: [
                          "${controller.bookedOfferDetails!['package_Name']} package:"
                              .text
                              .maxLines(2)
                              .overflow(TextOverflow.ellipsis)
                              .size(12.sp)
                              .color(bluesh)
                              .fontFamily(regular)
                              .make(),
                          5.heightBox,
                          Column(
                            crossAxisAlignment: crossstart,
                            children: List.generate(
                                controller.bookedOfferDetails!['Package_Tests']
                                    .length,
                                (index) =>
                                    "${index + 1}) ${controller.bookedOfferDetails!['Package_Tests'][index]}"
                                        .text
                                        .maxLines(1)
                                        .overflow(TextOverflow.ellipsis)
                                        .size(8.sp)
                                        .bold
                                        .make()),
                          )
                        ],
                      ),
                    ],
                  )
                      .box
                      .border(color: darkBlue)
                      .padding(defaultPadding)
                      .roundedSM
                      .make(),
                  20.heightBox,
                  "Appointment date & time"
                      .text
                      .fontFamily(regular)
                      .size(12.sp)
                      .color(bluesh)
                      .makeCentered(),
                  5.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            calender,
                            height: 25.h,
                            width: 25.w,
                            color: bluesh,
                          ),
                          10.widthBox,
                          DateFormat.yMEd()
                              .format(DateTime.parse(controller
                                  .bookedOfferDetails!['bookingDate']))
                              .text
                              .size(12.sp)
                              .color(darkBlue)
                              .fontFamily(regular)
                              .bold
                              .make(),
                        ],
                      ),
                      SizedBox(
                          height: 20.h,
                          child: const VerticalDivider(
                            color: darkBlue,
                          )),
                      Row(
                        children: [
                          Image.asset(
                            time,
                            height: 25.h,
                            width: 25.w,
                            color: bluesh,
                          ),
                          10.widthBox,
                          controller.bookedOfferDetails!['bookingTime']
                              .toString()
                              .text
                              .color(darkBlue)
                              .fontFamily(regular)
                              .bold
                              .size(12.sp)
                              .make(),
                        ],
                      ),
                    ],
                  )
                      .box
                      .border(color: darkBlue)
                      .padding(defaultPadding)
                      .roundedSM
                      .make(),
                  20.heightBox,
                  Row(
                    children: [
                      "Payment Method: ".text.size(12.sp).make(),
                      5.widthBox,
                      "Cash on sample"
                          .text
                          .size(12.sp)
                          .color(darkBlue)
                          .bold
                          .make()
                    ],
                  ),
                  Expanded(child: Container()),
                  Row(
                    children: [
                      "Total Amount: "
                          .text
                          .color(darkBlue)
                          .size(12.sp)
                          .fontFamily(regular)
                          .bold
                          .make(),
                      "Rs. ${controller.bookedOfferDetails!['total_Bill']} pkr"
                          .text
                          .color(redColor)
                          .size(12.sp)
                          .bold
                          .fontFamily(regular)
                          .make()
                    ],
                  ),
                  10.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customButtonOutlined(
                          onPress: () {
                            VxDialog.showAlert(context,
                                title: "Cancel Booking",
                                content: "Are you sure, to cancel the booking",
                                confirmBgColor: redColor,
                                showClose: true,
                                confirmTextColor: whiteColor, onPressed: () {
                              controller.cancelBooking(
                                  orderId: controller.bookedOfferDetails!.id);
                            });
                          },
                          btnName: "Cancel Booking",
                          borderColor: redColor,
                          textcolor: redColor),
                      customButtonRec(
                          onPress: () => Get.offAllNamed(Routes.NAV_BAR),
                          btnName: "Go to home",
                          bgColor: redColor,
                          textcolor: whiteColor)
                    ],
                  )
                ],
              )
                  .box
                  .color(halfwhite)
                  .roundedSM
                  .padding(defaultPadding)
                  .border(color: darkBlue)
                  .make(),
              // loadingWidget(text: pleasewait, value: controller.loading.value)
            ],
          ),
        ));
  }
}
