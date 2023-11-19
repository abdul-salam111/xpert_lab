import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:xpert_lab/app/appConst/index.dart';
import 'package:xpert_lab/app/modules/alerts/controllers/alerts_controller.dart';
import 'package:xpert_lab/app/modules/navBar/controllers/nav_bar_controller.dart';
import 'package:xpert_lab/app/routes/app_pages.dart';
import 'package:badges/badges.dart' as badges;

Widget notificationBadge({required bool showBadge, required String count}) {
  return badges.Badge(
    position: badges.BadgePosition.topEnd(top: 0, end: 0),
    showBadge: showBadge,
    ignorePointer: false,
    onTap: () {
      Get.toNamed(Routes.CART_SCREEN);
    },
    badgeContent: Text(
      count,
      style: TextStyle(color: whiteColor, fontSize: 12.sp),
    ),
    badgeAnimation: const badges.BadgeAnimation.rotation(
      animationDuration: Duration(seconds: 1),
      colorChangeAnimationDuration: Duration(seconds: 1),
      loopAnimation: false,
      curve: Curves.fastOutSlowIn,
      colorChangeAnimationCurve: Curves.easeInCubic,
    ),
    child: IconButton(
        onPressed: () {
          Get.toNamed(Routes.CART_SCREEN);
        },
        icon: const Icon(Icons.shopping_cart_outlined)),
  );
}

Widget notificationBadgeforNotifiction(
    {required bool showBadge, required String count}) {
  return badges.Badge(
      position: badges.BadgePosition.topEnd(top: 0, end: 0),
      showBadge: showBadge,
      ignorePointer: false,
      onTap: (){
        Get.put(NavBarController()).selectedTab.value=3;
        var controller=Get.put(AlertsController());
        controller.notificationCount.value=0;
        
      },
      badgeContent: Text(
        count,
        style: TextStyle(color: whiteColor, fontSize: 12.sp),
      ),
      badgeAnimation: const badges.BadgeAnimation.rotation(
        animationDuration: Duration(seconds: 1),
        colorChangeAnimationDuration: Duration(seconds: 1),
        loopAnimation: false,
        curve: Curves.fastOutSlowIn,
        colorChangeAnimationCurve: Curves.easeInCubic,
      ),
      child: Image.asset(
        notificationIcon,
        width: 20.h,
        height: 20.h,
        fit: BoxFit.cover,
      ));
}
