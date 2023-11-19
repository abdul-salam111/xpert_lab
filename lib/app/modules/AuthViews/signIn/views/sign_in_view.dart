import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:xpert_lab/app/modules/AuthViews/signIn/views/forgotPassword.dart';
import '../../../../appConst/index.dart';
import '../../../index.dart';

class SignInView extends GetView<SignInController> {
  SignInView({Key? key}) : super(key: key);
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return bgwidget(WillPopScope(
      onWillPop: () async => controller.isLoading.value == true ? false : true,
      child: Scaffold(
          body: Stack(
        children: [
          Padding(
            padding: padding20,
            child: SingleChildScrollView(
              physics: bouncing,
              child: Column(
                children: [
                  HeightBox(60.h),
                  mainAppLogo(),
                  HeightBox(40.h),
                  Form(
                      key: _formkey,
                      child: Column(
                        crossAxisAlignment: crossstart,
                        children: [
                          20.heightBox,
                          welcomtext,
                          HeightBox(5.h),
                          signincontinue.text
                              .color(fullgrey)
                              .size(16.sp)
                              .letterSpacing(0.5)
                              .fontFamily(regular)
                              .make(),
                          30.heightBox,
                          customTextFields(
                              texteditingController: controller.email,
                              Label: emailLabel,
                              hintText: emailLabel,
                              prefixicon: emailicon),
                          20.heightBox,
                          passWordTextField(
                            texteditingcontroller: controller.password,
                            hintText: passwordHint,
                            Label: passwordLabel,
                            prefixicon: lockicon,
                          ),
                          Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {
                                  Get.to(()=>const ForgotPasswordScreen());
                                },
                                child: "Forgot Password"
                                    .text
                                    .color(darkBlue)
                                    .make(),
                              )),
                          customButton(
                              onPress: () {
                                if (_formkey.currentState!.validate()) {
                                  controller.loginMethod(
                                      email: controller.email.text,
                                      password: controller.password.text);
                                }
                              },
                              btnName: signinBtn,
                              bgColor: redColor,
                              textcolor: whiteColor,
                              btnSize: Size(double.infinity, 35.h)),
                          10.heightBox,
                          logintext(donthaveaccount, registeraccount),
                          20.heightBox,
                          orwidget,
                          20.heightBox,
                          continuewith.text
                              .size(16)
                              .color(darkBlue)
                              .fontFamily(regular)
                              .makeCentered(),
                          20.heightBox,
                          socialLoginicons,
                          10.heightBox,
                        ],
                      ))
                ],
              ),
            ),
          ),
          Obx(() => loadingWidget(
              text: pleasewait, value: controller.isLoading.value))
        ],
      )),
    ));
  }

  Widget passWordTextField(
      {texteditingcontroller,
      String? hintText,
      String? Label,
      IconData? prefixicon,
      String? borderType = "round"}) {
    return Obx(
      () => Column(
        crossAxisAlignment: crossstart,
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 12, bottom: 5),
              child: Text(
                Label!,
                style: textfieldlabelStyle,
              )),
          SizedBox(
            height: 35.h,
            child: TextFormField(
              controller: texteditingcontroller,
              obscureText: controller.isVisible.value,
              style: textfieldinputstyle,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  prefixicon,
                  color: darkBlue,
                ),
                contentPadding: textfieldpadding,
                hintText: hintText,
                suffixIcon: Icon(
                  controller.isVisible.value
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: darkBlue,
                ).box.make().onTap(() {
                  controller.isVisible.value == true
                      ? controller.isVisible.value = false
                      : controller.isVisible.value = true;
                }),
                alignLabelWithHint: true,
                enabledBorder:
                    borderType == "round" ? enableborder : enableborderRec,
                focusedBorder:
                    borderType == "round" ? focusborder : focusborderRec,
                border: borderType == "round" ? enableborder : enableborderRec,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
