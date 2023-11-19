import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:xpert_lab/app/appConst/index.dart';
import 'package:xpert_lab/app/modules/index.dart';
import 'package:intl/intl.dart';

class ReportDetails extends GetView<ReportsController> {
  const ReportDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: defaultPadding,
          child: Column(
            crossAxisAlignment: crossstart,
            children: [
              mainAppLogoforReport(),
              SizedBox(
                height: 20.h,
                width: double.infinity,
                child: "Opp DHQ Hospital Link Road Abbottabad"
                    .text
                    .white
                    .bold
                    .fontFamily(bold)
                    .makeCentered(),
              ).box.color(darkBlue).make(),
              10.heightBox,
              Padding(
                padding: defaultPadding,
                child: Column(
                  mainAxisAlignment: mainspbet,
                  crossAxisAlignment: crossstart,
                  children: [
                    Row(
                      mainAxisAlignment: mainspbet,
                      children: [
                        Column(
                          crossAxisAlignment: crossstart,
                          children: [
                            RichText(
                                text: TextSpan(children: [
                              spanWidgetSimple(text: "Patient Name: "),
                              spanWidgetBold(
                                  text: controller
                                      .queryDocumentSnapshot!['patientName']
                                      .toString())
                            ])),
                            5.heightBox,
                            RichText(
                                text: TextSpan(children: [
                              spanWidgetSimple(text: "Sex: "),
                              spanWidgetBold(
                                  text: controller
                                      .queryDocumentSnapshot!['gender']
                                      .toString())
                            ])),
                            5.heightBox,
                            RichText(
                                text: TextSpan(children: [
                              spanWidgetSimple(text: "Booking Date: "),
                              spanWidgetBold(
                                  text: DateFormat.yMEd()
                                      .format(DateTime.parse(
                                          controller.queryDocumentSnapshot![
                                              'bookingDate']))
                                      .toString())
                            ])),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: crossstart,
                          children: [
                            RichText(
                                text: TextSpan(children: [
                              spanWidgetSimple(text: "Test Id: "),
                              spanWidgetBold(
                                  text: controller
                                      .queryDocumentSnapshot!['bookingId']
                                      .toString())
                            ])),
                            5.heightBox,
                            RichText(
                                text: TextSpan(children: [
                              spanWidgetSimple(text: "Contact No: "),
                              spanWidgetBold(
                                  text: controller
                                      .queryDocumentSnapshot!['phoneNo']
                                      .toString())
                            ])),
                            5.heightBox,
                            RichText(
                                text: TextSpan(children: [
                              spanWidgetSimple(text: "Time: "),
                              spanWidgetBold(
                                  text: controller
                                      .queryDocumentSnapshot!['bookingTime']
                                      .toString())
                            ])),
                          ],
                        ),
                      ],
                    ),
                    5.heightBox,
                    RichText(
                        text: TextSpan(children: [
                      spanWidgetSimple(text: "Address: "),
                      spanWidgetBold(
                          text: controller.queryDocumentSnapshot!['address']
                              .toString())
                    ])),
                    5.heightBox,
                    RichText(
                        text: TextSpan(children: [
                      spanWidgetSimple(text: "Report generated Date & Time: "),
                      spanWidgetBold(
                          text: controller
                              .queryDocumentSnapshot!['reportGenerateDateTime']
                              .toString()),
                    ])),
                    const Divider(
                      color: darkBlue,
                      thickness: 1,
                    ),
                    10.heightBox,
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: mainspbet,
                children: [
                  "Tests"
                      .text
                      .bold
                      .color(darkBlue)
                      .size(12.sp)
                      .fontFamily(regular)
                      .make(),
                  "Normal Range"
                      .text
                      .bold
                      .color(darkBlue)
                      .size(12.sp)
                      .fontFamily(regular)
                      .make(),
                  "Units"
                      .text
                      .bold
                      .color(darkBlue)
                      .size(12.sp)
                      .fontFamily(regular)
                      .make(),
                  "Reports"
                      .text
                      .bold
                      .color(darkBlue)
                      .size(12.sp)
                      .fontFamily(regular)
                      .make(),
                ],
              ).box.color(greyColor).padding(const EdgeInsets.all(5)).make(),
              5.heightBox,
              Column(
                crossAxisAlignment: crossstart,
                children: [
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: (jsonDecode(
                                  controller.queryDocumentSnapshot!['reports'])
                              as Map<dynamic, dynamic>)
                          .keys
                          .length,
                      itemBuilder: (context, index) {
                        var reportsdata = (jsonDecode(
                                controller.queryDocumentSnapshot!['reports'])
                            as Map<dynamic, dynamic>);
                        var key = reportsdata.keys;
                        var keylist = [];
                        for (var e in key) {
                          keylist.add(e);
                        }

                        var data = reportsdata[keylist[index]].toString();
                        var range = "Null";
                        var unit = "Null";
                        var reportresult = "Null";
                        if (data.contains("rng")) {
                          var splitdata = data.split("rng");
                          // ['1213','rng235unit65']
                          reportresult = splitdata[0];
                          if (splitdata[1].contains('unit')) {
                            range = splitdata[1]
                                .split("unit")[0]
                                .replaceAll("rng", "");
                            // ['rng235','unit65']
                            unit = splitdata[1]
                                .split("unit")[1]
                                .replaceAll("unit", "");
                          } else {
                            range = splitdata[1].replaceAll("rng", "");
                          }
                        } else {
                          reportresult = data;
                        }

                        return Container(
                          padding: const EdgeInsets.all(3),
                          decoration: const BoxDecoration(
                              border: BorderDirectional(
                                  bottom: BorderSide(
                                      style: BorderStyle.solid,
                                      color: darkBlue))),
                          child: Row(
                            mainAxisAlignment: mainspbet,
                            children: [
                              SizedBox(
                                width: 100.w,
                                child: keylist[index]
                                    .toString()
                                    .text
                                    .color(darkBlue)
                                    .size(12.sp)
                                    .fontFamily(regular)
                                    .make(),
                              ),
                              SizedBox(
                                width: 70.w,
                                child: range
                                    .toString()
                                    .text
                                    .color(darkBlue)
                                    .size(12.sp)
                                    .fontFamily(regular)
                                    .make(),
                              ),
                              SizedBox(
                                width: 70.w,
                                child: unit
                                    .toString()
                                    .text
                                    .color(darkBlue)
                                    .size(12.sp)
                                    .fontFamily(regular)
                                    .makeCentered(),
                              ),
                              SizedBox(
                                width: 70.w,
                                child: reportresult
                                    .toString()
                                    .text
                                    .color(darkBlue)
                                    .size(12.sp)
                                    .fontFamily(regular)
                                    .makeCentered(),
                              ),
                            ],
                          ),
                        );
                      }),
                  20.heightBox,
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: "Comments:".text.bold.size(15.sp).make(),
                  ),
                  5.heightBox,
                  Padding(
                    padding: const EdgeInsets.all(3),
                    child: controller
                        .queryDocumentSnapshot!['additionalRemarks']
                        .toString()
                        .text
                        .size(12.sp)
                        .make(),
                  ),
                 
                
                ],
              ),
              Expanded(child: Container()),
                Padding(
                  padding:defaultPadding,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      "Total Amount: ".text.bold.make(),
                      "${controller.queryDocumentSnapshot!['totalBill']} pkr".toString().text.make()
                    ],
                  ),
                ),
                10.heightBox,
            ],
          ).box.white.border(color: darkBlue).outerShadow.roundedSM.make(),
        ),
      ),
    );
  }
}
