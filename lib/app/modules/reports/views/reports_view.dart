import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:xpert_lab/app/modules/reports/views/invoiceServices.dart';
import 'package:xpert_lab/app/modules/reports/views/reportDetails.dart';
import '../../../appConst/index.dart';
import '../../../data/invoice.dart';
import '../../../data/supplier.dart';
import '../../index.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class ReportsView extends GetView<ReportsController> {
  ReportsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        appBar: customAppBar(titletext: reports),
        body: Padding(
          padding: defaultPadding,
          child: Column(
            children: [
              Obx(
                () => Align(
                  alignment: Alignment.topRight,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: Text(
                        'Select Report',
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
                () => FutureBuilder(
                    future:
                        controller.selectBookingType.value == "Package Reports"
                            ? controller.getAllPackageReports()
                            : controller.getAllSimpleReports(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return Expanded(child: loading());
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return Expanded(child: loading());
                      } else if (snapshot.data!.docs.isEmpty) {
                        return Expanded(
                            child: collectionEmpty("No reports uploaded yet"));
                      }
                      return Obx(
                        () => controller.selectBookingType.value ==
                                "Package Reports"
                            ? Expanded(
                                child: ListView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: snapshot.data!.docs.length,
                                    itemBuilder: (context, index) {
                                      var data = snapshot.data!.docs[index];

                                      return Container(
                                        padding: defaultPadding,
                                        margin: defaultPadding,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: darkBlue,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Column(
                                          crossAxisAlignment: crossstart,
                                          mainAxisAlignment: mainspbet,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            appointmentdateandtime.text
                                                .fontFamily(regular)
                                                .size(12.sp)
                                                .color(bluesh.withAlpha(150))
                                                .make(),
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
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            bookingId.text
                                                                .fontFamily(
                                                                    regular)
                                                                .bold
                                                                .size(12.sp)
                                                                .color(darkBlue)
                                                                .letterSpacing(
                                                                    0.5)
                                                                .make(),
                                                            5.heightBox,
                                                            data['bookingId']
                                                                .toString()
                                                                .text
                                                                .color(bluesh)
                                                                .size(12.sp)
                                                                .fontFamily(
                                                                    regular)
                                                                .letterSpacing(
                                                                    0.5)
                                                                .make()
                                                          ],
                                                        ),
                                                        20.widthBox,
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            "Packge:"
                                                                .text
                                                                .fontFamily(
                                                                    regular)
                                                                .bold
                                                                .size(12.sp)
                                                                .color(darkBlue)
                                                                .letterSpacing(
                                                                    0.5)
                                                                .make(),
                                                            5.heightBox,
                                                            SizedBox(
                                                              width: 120.w,
                                                              child: data[
                                                                      'packageName']
                                                                  .toString()
                                                                  .text
                                                                  .color(bluesh)
                                                                  .size(12.sp)
                                                                  .overflow(
                                                                      TextOverflow
                                                                          .ellipsis)
                                                                  .fontFamily(
                                                                      regular)
                                                                  .make(),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    5.heightBox,
                                                    SizedBox(
                                                      width: 220.w,
                                                      child: const Divider(
                                                        color: darkBlue,
                                                        thickness: 1,
                                                      ),
                                                    ),
                                                    5.heightBox,
                                                    Row(
                                                      children: [
                                                        benfName.text
                                                            .fontFamily(regular)
                                                            .bold
                                                            .size(12.sp)
                                                            .color(darkBlue)
                                                            .make(),
                                                        5.widthBox,
                                                        SizedBox(
                                                          width: 100.w,
                                                          child: Text(
                                                            data['patientName'],
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
                                                        ),
                                                      ],
                                                    ),
                                                    10.heightBox,
                                                    Row(
                                                      children: [
                                                        "Status:"
                                                            .text
                                                            .fontFamily(regular)
                                                            .size(12.sp)
                                                            .bold
                                                            .make(),
                                                        5.widthBox,
                                                        "Completed"
                                                            .text
                                                            .size(12.sp)
                                                            .bold
                                                            .color(greenColor)
                                                            .make()
                                                      ],
                                                    ),
                                                    10.heightBox,
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        ElevatedButton(
                                                          onPressed: () {
                                                            controller
                                                                    .queryDocumentSnapshot =
                                                                data;
                                                            Get.to(() =>
                                                                const ReportDetails());
                                                          },
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                                  shape:
                                                                      const StadiumBorder(),
                                                                  minimumSize:
                                                                      Size(80.w,
                                                                          25.h),
                                                                  backgroundColor:
                                                                      bluesh),
                                                          child: "View"
                                                              .text
                                                              .size(12.sp)
                                                              .make(),
                                                        ),
                                                        10.widthBox,
                                                        OutlinedButton(
                                                            onPressed:
                                                                () async {
                                                              final imageJpg =
                                                                  (await rootBundle
                                                                          .load(
                                                                              'assets/images/appLogo.jpg'))
                                                                      .buffer
                                                                      .asUint8List();
                                                              final invoice =
                                                                  Invoice(
                                                                comments: data[
                                                                    'additionalRemarks'],
                                                                patientDetails: PatientDetails(
                                                                    name: data[
                                                                            'patientName']
                                                                        .toString(),
                                                                    testId: data[
                                                                        'bookingId'],
                                                                    sex: data[
                                                                        'gender'],
                                                                    bookingDate: DateFormat.yMEd()
                                                                        .format(DateTime.parse(data[
                                                                            'bookingDate']))
                                                                        .toString(),
                                                                    bookingTime:
                                                                        data['bookingTime']
                                                                            .toString(),
                                                                    reportGeneratedDT:
                                                                        data['reportGenerateDateTime']
                                                                            .toString(),
                                                                    contactno:
                                                                        data['phoneNo']
                                                                            .toString(),
                                                                    address: data[
                                                                            'address']
                                                                        .toString()),
                                                                totalAmount: data[
                                                                    'totalBill'],
                                                                logo: imageJpg,
                                                                reports: data[
                                                                    'reports'],
                                                              );

                                                              final pdfFile =
                                                                  await pdfInvoiceApi
                                                                      .generatepdf(
                                                                          invoice);
                                                              PdfApi.openFile(
                                                                  pdfFile);
                                                            },
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              minimumSize: Size(
                                                                  80.w, 25.h),
                                                              shape: const StadiumBorder(
                                                                  side: BorderSide(
                                                                      color:
                                                                          redColor,
                                                                      width: 2,
                                                                      strokeAlign:
                                                                          2)),
                                                            ),
                                                            child: downloads
                                                                .text
                                                                .color(redColor)
                                                                .size(12.sp)
                                                                .make())
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                              )
                            : Expanded(
                                child: ListView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: snapshot.data!.docs.length,
                                    itemBuilder: (context, index) {
                                      var datas = snapshot.data!.docs[index];
                                      var reportsdatas =
                                          jsonDecode(datas['reports']);
                                      var mykeys = reportsdatas.keys;

                                      return Container(
                                        padding: defaultPadding,
                                        margin: defaultPadding,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: darkBlue,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Column(
                                          crossAxisAlignment: crossstart,
                                          mainAxisAlignment: mainspbet,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            appointmentdateandtime.text
                                                .fontFamily(regular)
                                                .size(12.sp)
                                                .color(bluesh.withAlpha(150))
                                                .make(),
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
                                                                .parse(datas[
                                                                    'bookingDate']))
                                                            .text
                                                            .fontFamily(regular)
                                                            .size(20.sp)
                                                            .color(darkBlue)
                                                            .make(),
                                                        "${DateFormat.M().format(DateTime.parse(datas['bookingDate']))} ${DateFormat.y().format(DateTime.parse(datas['bookingDate']))}"
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
                                                    datas['bookingTime']
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
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            bookingId.text
                                                                .fontFamily(
                                                                    regular)
                                                                .bold
                                                                .size(12.sp)
                                                                .color(darkBlue)
                                                                .letterSpacing(
                                                                    0.5)
                                                                .make(),
                                                            5.heightBox,
                                                            datas['bookingId']
                                                                .toString()
                                                                .text
                                                                .color(bluesh)
                                                                .size(12.sp)
                                                                .fontFamily(
                                                                    regular)
                                                                .letterSpacing(
                                                                    0.5)
                                                                .make()
                                                          ],
                                                        ),
                                                        20.widthBox,
                                                        Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            testname.text
                                                                .fontFamily(
                                                                    regular)
                                                                .bold
                                                                .size(12.sp)
                                                                .color(darkBlue)
                                                                .letterSpacing(
                                                                    0.5)
                                                                .make(),
                                                            5.heightBox,
                                                            SizedBox(
                                                              width: 120.w,
                                                              child: mykeys
                                                                  .first
                                                                  .toString()
                                                                  .text
                                                                  .color(bluesh)
                                                                  .size(12.sp)
                                                                  .overflow(
                                                                      TextOverflow
                                                                          .ellipsis)
                                                                  .fontFamily(
                                                                      regular)
                                                                  .make(),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    5.heightBox,
                                                    SizedBox(
                                                      width: 220.w,
                                                      child: const Divider(
                                                        color: darkBlue,
                                                        thickness: 1,
                                                      ),
                                                    ),
                                                    5.heightBox,
                                                    Row(
                                                      children: [
                                                        benfName.text
                                                            .fontFamily(regular)
                                                            .bold
                                                            .size(12.sp)
                                                            .color(darkBlue)
                                                            .make(),
                                                        5.widthBox,
                                                        SizedBox(
                                                          width: 100.w,
                                                          child: Text(
                                                            datas[
                                                                'patientName'],
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
                                                        ),
                                                      ],
                                                    ),
                                                    10.heightBox,
                                                    Row(
                                                      children: [
                                                        "Status:"
                                                            .text
                                                            .fontFamily(regular)
                                                            .size(12.sp)
                                                            .bold
                                                            .make(),
                                                        5.widthBox,
                                                        "Completed"
                                                            .text
                                                            .size(12.sp)
                                                            .bold
                                                            .color(greenColor)
                                                            .make()
                                                      ],
                                                    ),
                                                    10.heightBox,
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        ElevatedButton(
                                                          onPressed: () {
                                                            controller
                                                                    .queryDocumentSnapshot =
                                                                datas;
                                                            Get.to(() =>
                                                                const ReportDetails());
                                                          },
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                                  shape:
                                                                      const StadiumBorder(),
                                                                  minimumSize:
                                                                      Size(80.w,
                                                                          25.h),
                                                                  backgroundColor:
                                                                      bluesh),
                                                          child: "View"
                                                              .text
                                                              .size(12.sp)
                                                              .make(),
                                                        ),
                                                        10.widthBox,
                                                        OutlinedButton(
                                                            onPressed:
                                                                () async {
                                                              final imageJpg =
                                                                  (await rootBundle
                                                                          .load(
                                                                              'assets/images/appLogo.jpg'))
                                                                      .buffer
                                                                      .asUint8List();
                                                              final invoice =
                                                                  Invoice(
                                                                comments: datas[
                                                                    'additionalRemarks'],
                                                                patientDetails: PatientDetails(
                                                                    name: datas['patientName']
                                                                        .toString(),
                                                                    testId: datas[
                                                                        'bookingId'],
                                                                    sex: datas[
                                                                        'gender'],
                                                                    bookingDate: DateFormat
                                                                            .yMEd()
                                                                        .format(DateTime.parse(datas[
                                                                            'bookingDate']))
                                                                        .toString(),
                                                                    bookingTime:
                                                                        datas['bookingTime']
                                                                            .toString(),
                                                                    reportGeneratedDT:
                                                                        datas['reportGenerateDateTime']
                                                                            .toString(),
                                                                    contactno:
                                                                        datas['phoneNo']
                                                                            .toString(),
                                                                    address:
                                                                        datas['address']
                                                                            .toString()),
                                                                totalAmount: datas[
                                                                    'totalBill'],
                                                                logo: imageJpg,
                                                                reports: datas[
                                                                    'reports'],
                                                              );

                                                              final pdfFile =
                                                                  await pdfInvoiceApi
                                                                      .generatepdf(
                                                                          invoice);
                                                              PdfApi.openFile(
                                                                  pdfFile);
                                                            },
                                                            style:
                                                                ElevatedButton
                                                                    .styleFrom(
                                                              minimumSize: Size(
                                                                  80.w, 25.h),
                                                              shape: const StadiumBorder(
                                                                  side: BorderSide(
                                                                      color:
                                                                          redColor,
                                                                      width: 2,
                                                                      strokeAlign:
                                                                          2)),
                                                            ),
                                                            child: downloads
                                                                .text
                                                                .color(redColor)
                                                                .size(12.sp)
                                                                .make())
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                              ),
                      );
                    }),
              ),
            ],
          ),
        ));
  }
}
