import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../appConst/index.dart';

Widget homeScreenButton({String? iconName, String? btnName,  onPressed}) {
  return Column(
    children: [
      IconButton(
          onPressed: () {},
          icon: Image.asset(
            iconName!,
            width: 20.w,
            height: 20.h,
            fit: BoxFit.cover,
            color: whiteColor,
          )),
      "$btnName".text.white.align(TextAlign.center).size(11.sp).makeCentered()
    ],
  )
      .box
      .roundedSM.width(90.w)
      .color(darkBlue)
    
      .make().marginOnly(left: 10.w)
      .onTap( onPressed);
}
