import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../appConst/index.dart';
import '../../../data/index.dart';
import '../../index.dart';
import 'package:intl/intl.dart';

class AlertsView extends GetView<AlertsController> {
  const AlertsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        appBar: customAppBar(titletext: notifications),
        body: FutureBuilder(
            future: controller.getMyBookings(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return loading();
              } else if (snapshot.hasError) {
                return errorOcurred();
              } else if (snapshot.data!.docs.isEmpty) {
                return collectionEmpty("No notificatios to show...");
              } else {
                return ListView.builder(
                 
                    shrinkWrap: true,
                    physics: bouncing,
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var testbookingmodel =
                          TestBooking.fromJson(snapshot.data!.docs[index]);

                      return Row(
                        crossAxisAlignment: crosscenter,
                        children: [
                          Image.asset(
                            notificationIcon,
                            width: 20.w,
                            height: 20.h,
                            color: index % 2 == 0 ? greenColor : yelloColor,
                          ),
                          10.widthBox,
                          Expanded(
                              child: RichText(
                                  textAlign: TextAlign.justify,
                                  text: TextSpan(
                                      style: TextStyle(
                                        height: 1.1.h,
                                      ),
                                      children: [
                                        spanWidgetBold(text: welcomemsg),
                                        spanWidgetSimple(text: "Booking Id: "),
                                        spanWidgetBold(
                                            text: testbookingmodel
                                                .testBookingId!),
                                        spanWidgetSimple(
                                            text: ", $appointment"),
                                        spanWidgetBold(
                                            text: DateFormat.yMEd()
                                                .format(DateTime.parse(
                                                    testbookingmodel.bookingDate
                                                        .toString()))
                                                .toString()),
                                        spanWidgetSimple(text: ", Time: "),
                                        spanWidgetBold(
                                            text:
                                                testbookingmodel.bookingTime!),
                                        spanWidgetSimple(text: withxpert),
                                        spanWidgetSimple(text: " Test Name: "),
                                        spanWidgetBold(
                                            text: testbookingmodel.testNames
                                                .toString()),
                                        spanWidgetSimple(text: "$testCharges "),
                                        spanWidgetBold(
                                            text:
                                                " ${testbookingmodel.totalBill} pkr, "),
                                        spanWidgetSimple(
                                            text: " Patient Name:"),
                                        spanWidgetBold(
                                            text:
                                                " ${testbookingmodel.added_By_Name}.")
                                      ]))),
                        ],
                      )
                          .box
                          .color(halfwhite)
                          .roundedSM
                          .margin(const EdgeInsets.only(
                              top: 5, left: 10, right: 10))
                          .padding(defaultPadding)
                          .make();
                    });
              }
            }));
  }
}
