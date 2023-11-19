import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:xpert_lab/app/appConst/index.dart';
import '../../index.dart';


class OffersAndDealsView extends GetView<OffersAndDealsController> {
  const OffersAndDealsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: customButtonRec(
          onPress: () {
            Get.to(() => const BookPackage());
          },
          btnName: "Book Now",
          bgColor: darkBlue,
          textcolor: whiteColor,
          btnSize: Size(double.infinity, 40.h)),
      appBar:
          AppBar(backgroundColor: darkBlue, title: const Text("Offer Details")),
      body: ListView(
        physics: bouncing,
        padding: defaultPadding,
        children: [
          CachedNetworkImage(
            imageUrl: "${controller.offerDetails!.packageImage}",
            height: 150.h,
            fit: BoxFit.cover,
          ).box.clip(Clip.antiAlias).outerShadow.rounded.make(),
          10.heightBox,
          "Packge: ${controller.offerDetails!.packageName}"
              .text
              .bold
              .fontFamily(regular)
              .size(12.sp)
              .make(),
          10.heightBox,
          Row(
            children: [
              "Package Price:".text.bold.fontFamily(regular).size(12.sp).make(),
              5.widthBox,
              "Rs.${controller.offerDetails!.discountedPrice}"
                  .text
                  .fontFamily(regular)
                  .size(12.sp)
                  .make(),
              5.widthBox,
              "Rs.${controller.offerDetails!.testActualPrice}"
                  .text
                  .size(12.sp)
                  .fontFamily(regular)
                  .color(redColor)
                  .lineThrough
                  .make(),
            ],
          ),
          10.heightBox,
          Row(
            children: [
              "Sample Type: ".toString().text.fontFamily(regular).bold.size(12.sp).make(),
              5.widthBox,
              controller.offerDetails!.sampleType.toString().text.fontFamily(regular).size(12.sp).make(),
            ],
          ),
            10.heightBox,
          Row(
            children: [
              "Turnaround Time: ".toString().text.fontFamily(regular).bold.size(12.sp).make(),
              5.widthBox,
              controller.offerDetails!.turnaroundTime.toString().text.fontFamily(regular).size(12.sp).make(),
            ],
          ),
          10.heightBox,
          "Package Tests:".text.size(12.sp).fontFamily(regular).bold.make(),
          5.heightBox,
          Column(
            crossAxisAlignment: crossstart,
            children: List.generate(
                (controller.offerDetails!.testNames)!.length,
                (index) => Container(
                      padding: defaultPadding,
                      child:
                          "* ${controller.offerDetails!.testNames![index]}"
                              .text
                              .fontFamily(regular)
                              .size(12.sp)
                              .make(),
                    )),
          ),
          10.heightBox,
          "Test Instructions:".text.bold.size(12.sp).fontFamily(regular).make(),
          5.heightBox,
          "${controller.offerDetails!.sampleCollectionInstruction}"
              .text
              .size(12.sp)
              .fontFamily(regular)
              .align(TextAlign.justify)
              .make(),
          10.heightBox,
          "Description:".text.bold.size(12.sp).fontFamily(regular).make(),
          5.heightBox,
          "${controller.offerDetails!.testDescription}"
              .text
              .size(12.sp)
              .fontFamily(regular)
              .align(TextAlign.justify)
              .make(),
        ],
      ),
    );
  }
}
