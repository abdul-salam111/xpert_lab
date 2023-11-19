import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../appConst/index.dart';
import '../../../routes/app_pages.dart';
import '../../index.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var contrller = Get.put(ProfileController());
    contrller.onReady();
    return Scaffold(
        backgroundColor: whiteColor,
        body: SingleChildScrollView(
          physics: bouncing,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        bluesh,
                        darkBlue,
                        darkBlue,
                      ],
                    )),
                    height: MediaQuery.of(context).size.height / 2,
                    width: double.infinity,
                    child: Padding(
                      padding: padding10,
                      child: Column(
                        crossAxisAlignment: crosscenter,
                        children: [
                          20.heightBox,
                          Align(
                            alignment: Alignment.topLeft,
                            child: IconButton(
                              onPressed: () => Get.offAllNamed(Routes.NAV_BAR),
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                color: whiteColor,
                              ),
                            ),
                          ),
                          const CircleAvatar(
                            backgroundImage: AssetImage(profileIcon),
                            radius: 50,
                          ).box.makeCentered(),
                          10.heightBox,
                          Obx(()=>
                             controller.userName.value.text
                                .fontFamily(regular)
                                .size(20.sp)
                                .white
                                .make(),
                          ),
                          5.heightBox,
                          currentUser!.email
                              .toString()
                              .text
                              .fontFamily(regular)
                              .size(14.sp)
                              .white
                              .make(),
                        ],
                      ),
                    ),
                  ),
                ],
              ).box.bottomRounded(value: 20).clip(Clip.antiAlias).make(),
              GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 6,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 5,
                              crossAxisSpacing: 5,
                              crossAxisCount: 3),
                      itemBuilder: (context, index) {
                        return Container(
                          width: 30.w,
                          height: 50.h,
                          color: halfwhite,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                index == 0
                                    ? profileIcon
                                    : index == 1
                                        ? orderIcon
                                        : index == 2
                                            ? reportIcon
                                            : index == 3
                                                ? customerCare
                                                : index == 4
                                                    ? cartIcon
                                                    : logout,
                                width: 40,
                                height: 40,
                                color: darkBlue,
                              ),
                              10.heightBox,
                              ' ${index == 0 ? personalinfo : index == 1 ? bookingHistory : index == 2 ? reportsconst : index == 3 ? customercare : index == 4 ? cart : logoutApp}'
                                  .text
                                  .size(14.sp)
                                  .fontFamily(regular)
                                  .semiBold
                                  .align(TextAlign.center)
                                  .color(darkBlue)
                                  .makeCentered()
                            ],
                          ),
                        ).box.rounded.clip(Clip.antiAlias).make().onTap(() {
                          if (index == 0) {
                            Get.to(() => const PersonalinfoView());
                          } else if (index == 1) {
                            Get.toNamed(Routes.ORDERS);
                          } else if (index == 2) {
                            Get.toNamed(Routes.REPORTS);
                          } else if (index == 3) {
                            Get.to(() => const CustomerCare());
                          } else if (index == 4) {
                            Get.toNamed(Routes.CART_SCREEN);
                          } else if (index == 5) {
                            controller.signOutUser();
                          }
                        });
                      })
                  .box
                  .rounded
                  .clip(Clip.antiAlias)
                  .padding(defaultPadding)
                  .make()
            ],
          ),
        ));
  }
}
