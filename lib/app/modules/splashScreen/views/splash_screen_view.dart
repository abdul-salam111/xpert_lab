import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../appConst/index.dart';
import '../../commonWidgets/index.dart';
import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return bgwidget(
      Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(appLogo),
              5.heightBox,
              labtestatyourdoorstep
                  .text
                  .color(greyColor)
                  .fontFamily(regular)
                  .letterSpacing(0.5)
                  .size(14.sp)
                  .wordSpacing(1)
                  .align(TextAlign.center)
                  .make()
            ],
          ))),
    );
  }
}
