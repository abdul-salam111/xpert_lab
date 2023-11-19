import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../appConst/index.dart';

var welcomtext = welcome.text
    .fontFamily(regular)
    .semiBold
    .color(darkBlue)
    .letterSpacing(0.6)
    .size(35.sp)
    .make();

var orwidget = const Row(
  children: [
    Expanded(
        child: Divider(
      color: greyColor,
    )),
    Text(" Or "),
    Expanded(
        child: Divider(
      color: greyColor,
    )),
  ],
);
