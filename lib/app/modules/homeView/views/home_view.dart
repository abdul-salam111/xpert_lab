import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:xpert_lab/app/data/addPackageModel.dart';
import 'package:xpert_lab/app/firebaseServices/firebaseServices.dart';
import 'package:xpert_lab/app/modules/commonWidgets/sliderwidget.dart';
import '../../../appConst/index.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../routes/app_pages.dart';
import '../../index.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: lightBlue,
          title: "𝙓𝙥𝙚𝙧𝙩 𝙇𝙖𝙗".text.white.make(),
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
        body: ListView(
          physics: bouncing,
          children: [
            2.heightBox,
            VxSwiper.builder(
                aspectRatio: 16 / 9,
                autoPlay: true,
                height: 150.h,
                viewportFraction: 0.95,
                enlargeCenterPage: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    color: lightBlue,
                    margin: const EdgeInsets.all(4),
                    child: Row(mainAxisAlignment: mainspbet, children: [
                      index == 0
                          ? Image.asset(
                              introimg3,
                            )
                          : index == 1
                              ? Image.asset(
                                  introimg2,
                                )
                              : Image.asset(
                                  introimg1,
                                ),
                      10.widthBox,
                      index == 0
                          ? sliderWidget(
                              heading: stayHealthy, body: accurateResult)
                          : index == 1
                              ? sliderWidget(heading: s1h1, body: s1b1)
                              : sliderWidget(heading: s2h, body: s2b)
                    ]),
                  ).box.roundedSM.clip(Clip.antiAlias).make();
                }),
            20.heightBox,
            bookatest.text
                .fontFamily(bold)
                .color(redColor)
                .size(17.sp)
                .makeCentered(),
            5.heightBox,
            Padding(
              padding: defaultPadding,
              child: Column(
                crossAxisAlignment: crossstart,
                children: [
                  SizedBox(
                    height: 30.h,
                    child: TextField(
                        onTap: () {
                          Get.toNamed(Routes.SEARCH_TESTS);
                        },
                        readOnly: true,
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
                          focusedBorder: focusborderRec,
                        )),
                  ),
                  20.heightBox,
                  Row(
                    mainAxisAlignment: mainspbet,
                    children: [
                      quickBook.text
                          .fontFamily(bold)
                          .color(redColor)
                          .size(17.sp)
                          .make(),
                      TextButton(
                          onPressed: () {
                            Get.toNamed(Routes.SEARCH_TESTS);
                          },
                          child: Text(
                            viewAll,
                            style: TextStyle(
                                color: greyColor,
                                fontFamily: regular,
                                fontSize: 13.sp),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 100.h,
                    child: FutureBuilder(
                        future: FirestoreServices.getcategoriesDetails(),
                        builder:
                            (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (!snapshot.hasData) {
                            return loading();
                          } else if (snapshot.hasError) {
                            return errorOcurred();
                          } else if (snapshot.data!.docs.isEmpty) {
                            return collectionEmpty(categoriesNotFound);
                          } else {
                            return ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: snapshot.data!.docs.length,
                                shrinkWrap: true,
                                itemBuilder: ((context, index) {
                                  var data = snapshot.data!.docs[index];
                                  return Padding(
                                    padding: defaultPadding,
                                    child: Column(
                                            mainAxisAlignment: mainspbet,
                                            children: [
                                          Center(
                                              child: cachednetworkimage(
                                                  url: data['category_Image']
                                                      .toString())),
                                          5.heightBox,
                                          "${data['category_Name']}"
                                              .text
                                              .color(bluesh)
                                              .align(TextAlign.center)
                                              .size(13.sp)
                                              .bold
                                              .fontFamily(regular)
                                              .make(),
                                        ])
                                        .box
                                        .color(greyColor.withOpacity(0.2))
                                        .width(100.w)
                                        .roundedSM
                                        .clip(Clip.antiAlias)
                                        .padding(defaultPadding)
                                        .make()
                                        .onTap(() {
                                      var testcat =
                                          Get.put(TestcategoriesController());
                                      testcat.testCategoryName.value =
                                          data['category_Name'].toString();

                                      Get.toNamed(Routes.TESTCATEGORIES);
                                    }),
                                  );
                                }));
                          }
                        }),
                  ),
                  20.heightBox,
                  offers.text
                      .fontFamily(bold)
                      .color(redColor)
                      .size(17.sp)
                      .make(),
                  10.heightBox,
                  FutureBuilder(
                      future: FirestoreServices().getOffersAndDeals(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) {
                          return loading();
                        } else if (snapshot.hasError) {
                          return errorOcurred();
                        } else if (snapshot.data!.docs.isEmpty) {
                          return collectionEmpty(
                              "Currently we don't have any offer");
                        } else {
                          return SizedBox(
                            height: 200.h,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                physics: bouncing,
                                itemCount: snapshot.data!.docs.length,
                                itemBuilder: (context, index) {
                              var packagemodel=   AddPackageModel.fromJson(snapshot.data!.docs[index]);
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CachedNetworkImage(
                                        imageUrl: packagemodel.packageImage.toString(),
                                        height: 80.h,
                                        width: 150.w,
                                        fit: BoxFit.cover,
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                      )
                                          .box
                                          .roundedSM
                                          .outerShadowSm
                                          .clip(Clip.antiAlias)
                                          .make(),
                                      10.heightBox,
                                      SizedBox(
                                        height: 30.h,
                                        child: packagemodel.packageName.toString()
                                            .text
                                            .size(10.sp)
                                            .overflow(TextOverflow.ellipsis)
                                            .maxLines(2)
                                            .semiBold
                                            .make(),
                                      ),
                                      2.heightBox,
                                      Row(
                                        children: [
                                          "Rs: ${packagemodel.discountedPrice}"
                                              .text
                                              .size(11.sp)
                                              .make(),
                                          5.widthBox,
                                          "Rs: ${packagemodel.testActualPrice}"
                                              .text
                                              .lineThrough
                                              .color(redColor)
                                              .size(11.sp)
                                              .make()
                                        ],
                                      ),
                                      10.heightBox,
                                      Container(
                                        child: "Book"
                                            .text
                                            .bold
                                            .letterSpacing(0.5)
                                            .color(whiteColor)
                                            .makeCentered(),
                                      )
                                          .box
                                          .color(redColor)
                                          .roundedSM
                                          .size(150.w, 30.h)
                                          .make()
                                    ],
                                  )
                                      .box
                                      .padding(defaultPadding)
                                      .rounded
                                      .width(160.w)
                                      .clip(Clip.antiAlias)
                                      .make()
                                      .onTap(() {
                                    Get.put(OffersAndDealsController())
                                        .offerDetails = packagemodel;
                                    Get.toNamed(Routes.OFFERS_AND_DEALS);
                                  });
                                }),
                          );
                        }
                      }),
                  20.heightBox,
                  SizedBox(
                    height: 80.h,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      physics: bouncing,
                      children: [
                        homeScreenButton(
                            iconName: orderIcon,
                            btnName: "My Bookings",
                            onPressed: () => Get.toNamed(Routes.ORDERS)),
                        homeScreenButton(
                            iconName: reportIcon,
                            btnName: "My Reports",
                            onPressed: () {
                              Get.toNamed(Routes.REPORTS);
                            }),
                        homeScreenButton(
                            iconName: feedbackicon,
                            btnName: "Patient Feedback",
                            onPressed: () {
                              Get.put(HomeController());
                              showBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              1.5,
                                      child: Stack(
                                        children: [
                                          Padding(
                                                  padding: defaultPadding,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        crosscenter,
                                                    children: [
                                                      IconButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              icon: const Icon(
                                                                Icons.close,
                                                                color: redColor,
                                                              ))
                                                          .box
                                                          .alignTopRight
                                                          .make(),
                                                      "Patient Rating"
                                                          .text
                                                          .size(20.sp)
                                                          .fontFamily(regular)
                                                          .color(redColor)
                                                          .make(),
                                                      10.heightBox,
                                                      feedbackstatement.text
                                                          .size(12.sp)
                                                          .align(
                                                              TextAlign.center)
                                                          .make(),
                                                      10.heightBox,
                                                      RatingBar.builder(
                                                        initialRating: 3,
                                                        itemCount: 5,
                                                        itemBuilder:
                                                            (context, index) {
                                                          switch (index) {
                                                            case 0:
                                                              return dissatisfied;
                                                            case 1:
                                                              return dissatisfied;
                                                            case 2:
                                                              return neutralsatisfied;
                                                            case 3:
                                                              return satistied;
                                                            case 4:
                                                              return verysatisfied;
                                                            default:
                                                              return const Center();
                                                          }
                                                        },
                                                        onRatingUpdate:
                                                            (rating) {
                                                          controller.rating
                                                              .value = rating;
                                                        },
                                                      ),
                                                      10.heightBox,
                                                      Form(
                                                        child: Column(
                                                          children: [
                                                            customTextFields(
                                                                hintText:
                                                                    emailHint,
                                                                texteditingController:
                                                                    controller
                                                                        .emailController,
                                                                prefixicon:
                                                                    emailicon,
                                                                Label:
                                                                    emailLabel),
                                                            10.heightBox,
                                                            commentBox(
                                                              texteditingController:
                                                                  controller
                                                                      .additionRemarks,
                                                              Label:
                                                                  "Additional Remarks",
                                                              hintText: " ",
                                                            ),
                                                            10.heightBox,
                                                            customButton(
                                                                onPress: () {
                                                                  if (controller
                                                                          .emailController
                                                                          .text
                                                                          .isEmpty &&
                                                                      controller
                                                                          .additionRemarks
                                                                          .text
                                                                          .isEmpty) {
                                                                    Utils.showToast(
                                                                        msg:
                                                                            requiredFields,
                                                                        bgcolor:
                                                                            redColor);
                                                                  } else {
                                                                    controller
                                                                        .submitFeedBackAndRating();
                                                                  }
                                                                },
                                                                btnName:
                                                                    "Submit",
                                                                bgColor:
                                                                    darkBlue,
                                                                textcolor:
                                                                    whiteColor,
                                                                btnSize: Size(
                                                                    ScreenUtil()
                                                                            .screenWidth -
                                                                        60,
                                                                    40))
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ))
                                              .box
                                              .white
                                              .shadowLg
                                              .topRounded()
                                              .make(),
                                          Obx(() => loadingWidget(
                                              text: pleasewait,
                                              value: controller.loading.value))
                                        ],
                                      ),
                                    );
                                  });
                            }),
                        homeScreenButton(
                            iconName: informationicon,
                            btnName: "About Us",
                            onPressed: () => Get.to(() => const AboutUs())),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
