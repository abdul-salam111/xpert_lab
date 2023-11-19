import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../../appConst/index.dart';
import '../../../index.dart';

class ForgotPasswordScreen extends GetView<SignInController> {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkBlue,
        iconTheme: const IconThemeData(color: whiteColor),
        title: const Text("Forgot Password"),
      ),
      body: Stack(
        children: [
          Center(
            child: Padding(
              padding: defaultPadding,
              child: Column(
                mainAxisAlignment: maincenter,
                children: [
                  customTextFields(
                      texteditingController: controller.forgetPasswordEmail,
                      Label: emailLabel,
                      hintText: emailLabel,
                      prefixicon: emailicon),
                  20.heightBox,
                  customButton(
                      onPress: () {
                        controller.resetPassword(controller
                            .forgetPasswordEmail.text
                            .trim()
                            .toString());
                      },
                      btnName: "Reset Password",
                      bgColor: redColor,
                      textcolor: whiteColor,
                      btnSize: Size(double.infinity, 35.h)),
                  10.heightBox,
                ],
              ),
            ),
          ),
          Obx(() => loadingWidget(
              value: controller.isLoading.value, text: "Please wait"))
        ],
      ),
    );
  }
}
