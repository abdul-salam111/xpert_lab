import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:xpert_lab/app/modules/commonWidgets/index.dart';
import 'package:intl/intl.dart';
import 'package:xpert_lab/app/modules/profile/views/editProfile.dart';
import '../../../appConst/index.dart';
import '../controllers/profile_controller.dart';

class PersonalinfoView extends StatelessWidget {
  const PersonalinfoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var contrller = Get.put(ProfileController());
    contrller.onReady();
    return bgwidget(
      Scaffold(
          appBar: AppBar(
            title: const Text(personal),
            backgroundColor: darkBlue,
            centerTitle: true,
          ),
          body: Column(children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 40.r,
                  backgroundImage: const AssetImage(profileIcon),
                ),
                10.widthBox,
                Column(
                  crossAxisAlignment: crossstart,
                  children: [
                    contrller.usernameController.text.toString().text.white
                        .fontFamily(regular)
                        .bold
                        .size(17.sp)
                        .make(),
                    3.heightBox,
                    currentUser!.email.toString().text.size(14.sp).white.make()
                  ],
                )
              ],
            )
                .box
                .padding(padding12)
                .linearGradient(
                  [
                    lightBlue,
                    lightBlue,
                    darkBlue,
                    darkBlue,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )
                .color(darkBlue)
                .make(),
            Padding(
              padding: defaultPadding,
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          edit,
                          height: 20.h,
                          width: 20.w,
                        ).box.make().onTap(() {
                          Get.to(() => const EditProfile());
                        }),
                      )),
                  ListTile(
                    leading: const CircleAvatar(
                      radius: 15,
                      backgroundColor: whiteColor,
                      backgroundImage: AssetImage(profileIcon),
                    ),
                    title:
                        name.text.size(16.sp).color(lightBlue).semiBold.make(),
                    subtitle:
                        contrller.usernameController.text.toString().text.color(darkBlue).make(),
                  ),
                  const Divider(
                    height: 0,
                  ),
                  ListTile(
                    leading: const CircleAvatar(
                      radius: 15,
                      backgroundColor: whiteColor,
                      backgroundImage: AssetImage(gender),
                    ),
                    title: gendertitle.text
                        .size(16.sp)
                        .semiBold
                        .color(lightBlue)
                        .make(),
                    subtitle:
                        contrller.usergenderController.text.toString().text.color(darkBlue).make(),
                  ),
                  const Divider(
                    height: 0,
                  ),
                  ListTile(
                    leading: const CircleAvatar(
                      radius: 15,
                      backgroundColor: whiteColor,
                      backgroundImage: AssetImage(calender),
                    ),
                    title:
                        dob.text.size(16.sp).semiBold.color(lightBlue).make(),
                    subtitle: DateFormat.yMEd()
                        .format(DateTime.parse(contrller.dob.value.toString()))
                        .toString()
                        .text
                        .color(darkBlue)
                        .make(),
                  ),
                  const Divider(
                    height: 0,
                  ),
                  ListTile(
                    leading: const CircleAvatar(
                      radius: 15,
                      backgroundColor: whiteColor,
                      backgroundImage: AssetImage(smartphone),
                    ),
                    title: "Phone"
                        .text
                        .size(16.sp)
                        .semiBold
                        .color(lightBlue)
                        .make(),
                    subtitle:
                       contrller.userphoneNumberController.text.toString().text.color(darkBlue).make(),
                  ),
                  const Divider(
                    height: 0,
                  ),
                  ListTile(
                    leading: const CircleAvatar(
                      radius: 15,
                      backgroundColor: whiteColor,
                      backgroundImage: AssetImage(email),
                    ),
                    title: "Email"
                        .text
                        .size(16.sp)
                        .semiBold
                        .color(lightBlue)
                        .make(),
                    subtitle: currentUser!.email
                        .toString()
                        .text
                        .color(darkBlue)
                        .make(),
                  ),
                  const Divider(
                    height: 0,
                  ),
                ],
              ),
            )
          ])),
    );
  }
}
