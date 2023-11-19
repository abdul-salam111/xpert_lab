import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../appConst/index.dart';
import '../../../routes/app_pages.dart';
import '../controllers/welcome_screen_controller.dart';

class WelcomeScreenView extends GetView<WelcomeScreenController> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final introKey = GlobalKey<IntroductionScreenState>();
  WelcomeScreenView({super.key});
  Widget _buildImage(String assetName, [double width = double.infinity]) {
    return Image.asset(
      assetName,
      width: width.w,
    );
  }

  @override
  Widget build(BuildContext context) {
    var bodyStyle = TextStyle(
      fontSize: 15.sp,
      color: greyColor,
      letterSpacing: 0.6,
      wordSpacing: 0.5,
      fontFamily: regular,
    );
    var pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
          fontSize: 28.sp,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.4,
          color: bluesh,
          wordSpacing: 1),
      bodyTextStyle: bodyStyle,
      bodyPadding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: whiteColor,
      imagePadding: EdgeInsets.zero,
    );

    return Scaffold(
      body: IntroductionScreen(
        key: introKey,
        globalBackgroundColor: whiteColor,
        globalHeader: Align(
          alignment: Alignment.topLeft,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 16,
              ),
              child: _buildImage(appLogo, 100),
            ),
          ),
        ),
        globalFooter: ElevatedButton(
            onPressed: ()async{
               final SharedPreferences prefs = await _prefs;
          prefs.setBool("welcomeScreenDone", true);
              Get.offAllNamed(Routes.SIGN_IN);
              
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: darkBlue,
                minimumSize: Size(double.infinity, 50.h)),
            child: letsgo
                .text
                .color(whiteColor)
                .letterSpacing(0.5)
                .wordSpacing(0.5)
                .size(17.sp)
                .semiBold
                .fontFamily(regular)
                .make()),
        pages: [
          PageViewModel(
            title: title1,
            body: body1,
            image: _buildImage(introimg1),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: title2,
            body: body2,
            image: _buildImage(introimg2),
            decoration: pageDecoration,
          ),
          PageViewModel(
            title: title3,
            body: body3,
            image: _buildImage(introimg3),
            decoration: pageDecoration,
          ),
        ],
        onDone: () async {
          final SharedPreferences prefs = await _prefs;
          prefs.setBool("welcomeScreenDone", true);
          Get.toNamed(Routes.SIGN_IN);
        },

        showSkipButton: false,
        skipOrBackFlex: 0,
        nextFlex: 0,
        showBackButton: true,
        //rtl: true, // Display as right-to-left
        back: const Icon(
          Icons.arrow_back,
          color: whiteColor,
        ),

        next: const Icon(
          Icons.arrow_forward,
          color: whiteColor,
        ),
        done: const Text('Done',
            style: TextStyle(fontWeight: FontWeight.w600, color: whiteColor)),
        curve: Curves.fastLinearToSlowEaseIn,
        controlsMargin: const EdgeInsets.all(16),
        controlsPadding:
            kIsWeb ? padding12 : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
        dotsDecorator: DotsDecorator(
          size: Size(10.0.w, 10.0.h),
          color: whiteColor,
          activeSize: Size(22.0.w, 10.0.h),
          activeShape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
        dotsContainerDecorator: const ShapeDecoration(
          color: Colors.black87,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
          ),
        ),
      ),
    );
  }
}
