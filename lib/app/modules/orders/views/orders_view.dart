import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:xpert_lab/app/modules/index.dart';
import '../../../appConst/index.dart';
import 'package:intl/intl.dart';

class OrdersView extends GetView<OrdersController> {
  const OrdersView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        appBar: customAppBar(titletext: bookings),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Obx(
                () => Align(
                  alignment: Alignment.topRight,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: Text(
                        'Select Booking',
                        style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      items: controller.items
                          .map((String item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ))
                          .toList(),
                      value: controller.selectBookingType.value,
                      onChanged: (String? value) {
                        controller.selectBookingType.value = value!;
                      },
                      buttonStyleData: ButtonStyleData(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        height: 25.h,
                        width: 170.w,
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 40,
                      ),
                    ),
                  ).box.border().roundedSM.make(),
                ),
              ),
              Obx(
                () => controller.selectBookingType.value == "Simple Booking"
                    ? Expanded(
                        child: StreamBuilder(
                            stream: controller.getMyBookings(),
                            builder: (context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (!snapshot.hasData) {
                                return loading();
                              } else if (snapshot.hasError) {
                                return errorOcurred();
                              } else if (snapshot.data!.docs.isEmpty) {
                                return collectionEmpty(
                                    "No booking is made yet.");
                              } else {
                                return ListView.builder(
                                    physics: bouncing,
                                    itemCount: snapshot.data!.docs.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, int index) {
                                      var data = snapshot.data!.docs[index];
                                      return Container(
                                        padding: defaultPadding,
                                        margin: const EdgeInsets.fromLTRB(
                                            8, 14, 8, 8),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: darkBlue,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Column(
                                          crossAxisAlignment: crossstart,
                                          mainAxisAlignment: mainstart,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisAlignment: mainspbet,
                                              children: [
                                                "Appointment \ndate & time"
                                                    .text
                                                    .fontFamily(regular)
                                                    .size(12.sp)
                                                    .color(
                                                        bluesh.withAlpha(150))
                                                    .make(),
                                                OutlinedButton(
                                                    onPressed: () {
                                                      controller.orderDetails =
                                                          snapshot.data!
                                                              .docs[index];
                                                      Get.to(() =>
                                                          const OrderDetailsView());
                                                    },
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(0),
                                                            minimumSize: Size(
                                                                65.w, 25.h)),
                                                    child: "View Booking"
                                                        .text
                                                        .color(redColor)
                                                        .size(11.sp)
                                                        .make()),
                                              ],
                                            ),
                                            5.heightBox,
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                  children: [
                                                    Column(
                                                      children: [
                                                        DateFormat.d()
                                                            .format(DateTime
                                                                .parse(data[
                                                                    'bookingDate']))
                                                            .text
                                                            .fontFamily(regular)
                                                            .size(20.sp)
                                                            .color(darkBlue)
                                                            .make(),
                                                        "${DateFormat.M().format(DateTime.parse(data['bookingDate']))} ${DateFormat.y().format(DateTime.parse(data['bookingDate']))}"
                                                            .text
                                                            .fontFamily(regular)
                                                            .size(10.sp)
                                                            .color(darkBlue)
                                                            .make()
                                                      ],
                                                    )
                                                        .box
                                                        .color(halfwhite)
                                                        .roundedSM
                                                        .padding(defaultPadding)
                                                        .make(),
                                                    5.heightBox,
                                                    data['bookingTime']
                                                        .toString()
                                                        .substring(0, 8)
                                                        .text
                                                        .size(12.sp)
                                                        .fontFamily(regular)
                                                        .color(darkBlue)
                                                        .make()
                                                  ],
                                                )
                                                    .box
                                                    .padding(defaultPadding)
                                                    .roundedSM
                                                    .color(bluesh.withAlpha(50))
                                                    .make(),
                                                10.widthBox,
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            "booking Id:"
                                                                .text
                                                                .fontFamily(
                                                                    regular)
                                                                .bold
                                                                .size(12.sp)
                                                                .color(darkBlue)
                                                                .make(),
                                                            5.heightBox,
                                                            SizedBox(
                                                              width: 100.w,
                                                              child: Text(
                                                                data[
                                                                    'testBookingId'],
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style:
                                                                    TextStyle(
                                                                  color: bluesh,
                                                                  fontSize:
                                                                      12.sp,
                                                                  fontFamily:
                                                                      regular,
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            "Booking date"
                                                                .text
                                                                .fontFamily(
                                                                    regular)
                                                                .bold
                                                                .size(12.sp)
                                                                .color(darkBlue)
                                                                .make(),
                                                            5.heightBox,
                                                            SizedBox(
                                                              width: 100.w,
                                                              child: Text(
                                                                DateFormat
                                                                        .yMEd()
                                                                    .format(DateTime
                                                                        .parse(data[
                                                                            'bookingDate'])),
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style:
                                                                    TextStyle(
                                                                  color: bluesh,
                                                                  fontSize:
                                                                      12.sp,
                                                                  fontFamily:
                                                                      regular,
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width: 220.w,
                                                      child: const Divider(
                                                        color: darkBlue,
                                                        thickness: 1,
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          mainspbet,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            "Test name:"
                                                                .text
                                                                .fontFamily(
                                                                    regular)
                                                                .bold
                                                                .size(12.sp)
                                                                .color(darkBlue)
                                                                .make(),
                                                            5.heightBox,
                                                            SizedBox(
                                                              width: 100.w,
                                                              child: Text(
                                                                data['testNames']
                                                                    [0],
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      12.sp,
                                                                  color: bluesh,
                                                                  fontFamily:
                                                                      regular,
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        5.widthBox,
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            "Test status"
                                                                .text
                                                                .fontFamily(
                                                                    regular)
                                                                .bold
                                                                .size(12.sp)
                                                                .color(darkBlue)
                                                                .make(),
                                                            5.heightBox,
                                                            SizedBox(
                                                              width: 100.w,
                                                              child: Text(
                                                                "inProgress",
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style:
                                                                    TextStyle(
                                                                  color: redColor,
                                                                  fontSize:
                                                                      12.sp,
                                                                  fontFamily:
                                                                      regular,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    10.heightBox,
                                                    RichText(
                                                            text: TextSpan(
                                                                children: [
                                                          TextSpan(
                                                            text:
                                                                "Total Amount: ",
                                                            style: TextStyle(
                                                              color: whiteColor,
                                                              fontSize: 12.sp,
                                                              fontFamily:
                                                                  regular,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                              text:
                                                                  "${data['totalBill']} pkr",
                                                              style: TextStyle(
                                                                  color:
                                                                      whiteColor,
                                                                  fontSize:
                                                                      12.sp,
                                                                  fontFamily:
                                                                      regular,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold))
                                                        ]))
                                                        .box
                                                        .roundedSM
                                                        .padding(defaultPadding)
                                                        .color(darkBlue)
                                                        .make(),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    });
                              }
                            }),
                      )
                    : StreamBuilder(
                        stream: controller.getPackageBookings(),
                        builder:
                            (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (!snapshot.hasData) {
                            return loading();
                          } else if (snapshot.hasError) {
                            return errorOcurred();
                          } else if (snapshot.data!.docs.isEmpty) {
                            return Expanded(child: collectionEmpty("No Booking is made yet."));
                          } else {
                            return Expanded(
                              child: ListView.builder(
                                  physics: bouncing,
                                  itemCount: snapshot.data!.docs.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, int index) {
                                    var data = snapshot.data!.docs[index];
                                    return Container(
                                      padding: defaultPadding,
                                      margin:
                                          const EdgeInsets.fromLTRB(8, 14, 8, 8),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: darkBlue,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Column(
                                        crossAxisAlignment: crossstart,
                                        mainAxisAlignment: mainstart,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisAlignment: mainspbet,
                                            children: [
                                              "Appointment \ndate & time"
                                                  .text
                                                  .fontFamily(regular)
                                                  .size(12.sp)
                                                  .color(bluesh.withAlpha(150))
                                                  .make(),
                                              OutlinedButton(
                                                  onPressed: () {
                                                    Get.put(OffersAndDealsController())
                                                            .bookedOfferDetails =
                                                        data;
                                                    Get.to(() =>
                                                        const BookedPackagesDetails());
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                      padding:
                                                          const EdgeInsets.all(0),
                                                      minimumSize:
                                                          Size(65.w, 25.h)),
                                                  child: "View Booking"
                                                      .text
                                                      .color(redColor)
                                                      .size(11.sp)
                                                      .make()),
                                            ],
                                          ),
                                          5.heightBox,
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                children: [
                                                  Column(
                                                    children: [
                                                      DateFormat.d()
                                                          .format(DateTime.parse(
                                                              data[
                                                                  'bookingDate']))
                                                          .text
                                                          .fontFamily(regular)
                                                          .size(20.sp)
                                                          .color(darkBlue)
                                                          .make(),
                                                      "${DateFormat.M().format(DateTime.parse(data['bookingDate']))} ${DateFormat.y().format(DateTime.parse(data['bookingDate']))}"
                                                          .text
                                                          .fontFamily(regular)
                                                          .size(10.sp)
                                                          .color(darkBlue)
                                                          .make()
                                                    ],
                                                  )
                                                      .box
                                                      .color(halfwhite)
                                                      .roundedSM
                                                      .padding(defaultPadding)
                                                      .make(),
                                                  5.heightBox,
                                                  data['bookingTime']
                                                      .toString()
                                                      .substring(0, 8)
                                                      .text
                                                      .size(12.sp)
                                                      .fontFamily(regular)
                                                      .color(darkBlue)
                                                      .make()
                                                ],
                                              )
                                                  .box
                                                  .padding(defaultPadding)
                                                  .roundedSM
                                                  .color(bluesh.withAlpha(50))
                                                  .make(),
                                              10.widthBox,
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          "booking Id:"
                                                              .text
                                                              .fontFamily(regular)
                                                              .bold
                                                              .size(12.sp)
                                                              .color(darkBlue)
                                                              .make(),
                                                          5.heightBox,
                                                          SizedBox(
                                                            width: 100.w,
                                                            child: Text(
                                                              data['bookingId'],
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: TextStyle(
                                                                color: bluesh,
                                                                fontSize: 12.sp,
                                                                fontFamily:
                                                                    regular,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          "Booking date"
                                                              .text
                                                              .fontFamily(regular)
                                                              .bold
                                                              .size(12.sp)
                                                              .color(darkBlue)
                                                              .make(),
                                                          5.heightBox,
                                                          SizedBox(
                                                            width: 100.w,
                                                            child: Text(
                                                              DateFormat.yMEd()
                                                                  .format(DateTime
                                                                      .parse(data[
                                                                          'bookingDate'])),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: TextStyle(
                                                                color: bluesh,
                                                                fontSize: 12.sp,
                                                                fontFamily:
                                                                    regular,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width: 220.w,
                                                    child: const Divider(
                                                      color: darkBlue,
                                                      thickness: 1,
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment: mainspbet,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          "Package name:"
                                                              .text
                                                              .fontFamily(regular)
                                                              .bold
                                                              .size(12.sp)
                                                              .color(darkBlue)
                                                              .make(),
                                                          5.heightBox,
                                                          SizedBox(
                                                            width: 100.w,
                                                            child: Text(
                                                              data[
                                                                  "package_Name"],
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: TextStyle(
                                                                fontSize: 12.sp,
                                                                color: bluesh,
                                                                fontFamily:
                                                                    regular,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      5.widthBox,
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          "Status"
                                                              .text
                                                              .fontFamily(regular)
                                                              .bold
                                                              .size(12.sp)
                                                              .color(darkBlue)
                                                              .make(),
                                                          5.heightBox,
                                                          SizedBox(
                                                            width: 100.w,
                                                            child: Text(
                                                              "inProgress",
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: TextStyle(
                                                                color: redColor,
                                                                fontSize: 12.sp,
                                                                fontFamily:
                                                                    regular,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  10.heightBox,
                                                  RichText(
                                                          text: TextSpan(children: [
                                                    TextSpan(
                                                      text: "Total Amount: ",
                                                      style: TextStyle(
                                                        color: whiteColor,
                                                        fontSize: 12.sp,
                                                        fontFamily: regular,
                                                      ),
                                                    ),
                                                    TextSpan(
                                                        text:
                                                            "${data['total_Bill']} pkr",
                                                        style: TextStyle(
                                                            color: whiteColor,
                                                            fontSize: 12.sp,
                                                            fontFamily: regular,
                                                            fontWeight:
                                                                FontWeight.bold))
                                                  ]))
                                                      .box
                                                      .roundedSM
                                                      .padding(defaultPadding)
                                                      .color(darkBlue)
                                                      .make(),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                            );
                          }
                        }),
              ),
            ],
          ),
        ));
  }
}
