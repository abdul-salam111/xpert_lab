import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:xpert_lab/app/routes/app_pages.dart';
import '../../../appConst/index.dart';
import '../../../data/addToCart.dart';
import '../../../data/addnewtestmodel.dart';
import '../../index.dart';

class SearchTestsView extends StatefulWidget {
  const SearchTestsView({super.key});

  @override
  State<SearchTestsView> createState() => _SearchTestsViewState();
}

class _SearchTestsViewState extends State<SearchTestsView> {
  var searchingText;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: whiteColor,
        appBar: AppBar(
          backgroundColor: darkBlue,
          title: searchTest.text.make(),
          actions: [
            Obx(() {
              final cartController = Get.put(CartScreenController());
              return notificationBadge(
                showBadge:
                    cartController.notificationCount.value == 0 ? false : true,
                count: cartController.notificationCount.value.toString(),
              );
            }),
          ],
        ),
        body: SafeArea(
            child: Padding(
          padding: defaultPadding,
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
                child: TextField(
                  onChanged: (val) {
                    searchingText = val;
                    setState(() {});
                  },
                  decoration: InputDecoration(
                      suffixIcon: const Icon(
                        Icons.search,
                        color: darkBlue,
                      ),
                      contentPadding: defaultPadding,
                      hintText: lookingfor,
                      hintStyle: TextStyle(
                          color: greyColor,
                          fontSize: 12.sp,
                          fontFamily: regular),
                      enabledBorder: enableborderRec,
                      border: enableborderRec,
                      focusedBorder: focusborderRec),
                ),
              ),
              20.heightBox,
              StreamBuilder(
                  stream: firestore.collection(allTestscollection).snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return loading();
                    } else if (snapshot.hasError) {
                      return errorOcurred();
                    } else if (snapshot.data!.docs.isEmpty) {
                      return collectionEmpty("No test found...");
                    } else {
                      return Expanded(
                        child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              var testData = TestModel.fromJson(
                                  snapshot.data!.docs[index]);
                              if (searchingText == null) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    "${testData.testName}"
                                        .text
                                        .fontFamily(regular)
                                        .bold
                                        .size(12.sp)
                                        .make(),
                                    const Divider(
                                      thickness: 1,
                                    ),
                                    "${testData.referenceRange}"
                                        .text
                                        .fontFamily(regular)
                                        .size(10.sp)
                                        .make(),
                                    5.heightBox,
                                    SizedBox(
                                      child:
                                          "Sample Type: ${testData.sampleType}"
                                              .text
                                              .size(12.sp)
                                              .make(),
                                    )
                                        .box
                                        .padding(const EdgeInsets.all(3))
                                        .border(width: 0.5)
                                        .make(),
                                    5.heightBox,
                                    Row(
                                      children: [
                                        "${testData.testPrice} pkr"
                                            .text
                                            .fontFamily(regular)
                                            .size(12.sp)
                                            .color(redColor)
                                            .bold
                                            .make(),
                                        Expanded(child: Container()),
                                        ElevatedButton(
                                          onPressed: () {
                                            var testDetails = Get.put(
                                                TestDetailsController());
                                            testDetails.testDetailsdocument =
                                                testData;
                                            Get.toNamed(Routes.TEST_DETAILS);
                                          },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: darkBlue,
                                              minimumSize: Size(70.w, 25.h)),
                                          child: details.text.size(10).make(),
                                        ),
                                        2.widthBox,
                                        IconButton(
                                                onPressed: () {
                                                  var cartcontroller = Get.put(
                                                      CartScreenController());
                                                  cartcontroller
                                                      .addToCart(AddToCartModel(
                                                    testName: testData.testName,
                                                    testPrice:
                                                        testData.testPrice,
                                                    added_By_Id:
                                                        currentUser!.uid,
                                                  ));
                                                  cartcontroller
                                                      .notificationCount
                                                      .value = cartcontroller
                                                          .notificationCount
                                                          .value +
                                                      1;
                                                },
                                                icon: Icon(
                                                  Icons
                                                      .add_shopping_cart_rounded,
                                                  color: darkBlue,
                                                  size: 15.sp,
                                                ))
                                            .box
                                            .border()
                                            .roundedSM
                                            .size(30.w, 25.h)
                                            .make()
                                      ],
                                    )
                                  ],
                                )
                                    .box
                                    .roundedSM
                                    .padding(defaultPadding)
                                    .margin(const EdgeInsets.only(bottom: 5))
                                    .color(halfwhite)
                                    .make();
                              } if (testData.testName
                                  .toString().toLowerCase()
                                  .startsWith(searchingText.toLowerCase())) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    "${testData.testName}"
                                        .text
                                        .fontFamily(regular)
                                        .bold
                                        .size(12.sp)
                                        .make(),
                                    const Divider(
                                      thickness: 1,
                                    ),
                                    "${testData.referenceRange}"
                                        .text
                                        .fontFamily(regular)
                                        .size(10.sp)
                                        .make(),
                                    5.heightBox,
                                    SizedBox(
                                      child:
                                          "Sample Type: ${testData.sampleType}"
                                              .text
                                              .size(12.sp)
                                              .make(),
                                    )
                                        .box
                                        .padding(const EdgeInsets.all(3))
                                        .border(width: 0.5)
                                        .make(),
                                    5.heightBox,
                                    Row(
                                      children: [
                                        "${testData.testPrice} pkr"
                                            .text
                                            .fontFamily(regular)
                                            .size(12.sp)
                                            .color(redColor)
                                            .bold
                                            .make(),
                                        Expanded(child: Container()),
                                        ElevatedButton(
                                          onPressed: () {
                                            var testDetails = Get.put(
                                                TestDetailsController());
                                            testDetails.testDetailsdocument =
                                                testData;
                                            Get.toNamed(Routes.TEST_DETAILS);
                                          },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: darkBlue,
                                              minimumSize: Size(70.w, 25.h)),
                                          child: details.text.size(10).make(),
                                        ),
                                        2.widthBox,
                                        IconButton(
                                                onPressed: () {
                                                  var cartcontroller = Get.put(
                                                      CartScreenController());
                                                  cartcontroller
                                                      .addToCart(AddToCartModel(
                                                    testName: testData.testName,
                                                    testPrice:
                                                        testData.testPrice,
                                                    added_By_Id:
                                                        currentUser!.uid,
                                                  ));
                                                  cartcontroller
                                                      .notificationCount
                                                      .value = cartcontroller
                                                          .notificationCount
                                                          .value +
                                                      1;
                                                },
                                                icon: Icon(
                                                  Icons
                                                      .add_shopping_cart_rounded,
                                                  color: darkBlue,
                                                  size: 15.sp,
                                                ))
                                            .box
                                            .border()
                                            .roundedSM
                                            .size(30.w, 25.h)
                                            .make()
                                      ],
                                    )
                                  ],
                                )
                                    .box
                                    .roundedSM
                                    .padding(defaultPadding)
                                    .margin(const EdgeInsets.only(bottom: 5))
                                    .color(halfwhite)
                                    .make();
                              } else {
                                return Center();
                              }
                            }),
                      );
                    }
                  }),
            ],
          ),
        )));
  }
}
