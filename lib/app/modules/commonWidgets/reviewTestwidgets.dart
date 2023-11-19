import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../appConst/index.dart';
import 'index.dart';

Widget reviewTestwidget({String? iconname, String? title, String? subtitle, Color?subtitlecolor}) {
  return Row(
    children: [
      Image.asset(
        iconname!,
        width: 30.w,
        height: 30.h,
      ),
      10.widthBox,
      Column(
       
        crossAxisAlignment: crossstart,
        children: [
          title!.text.color(bluesh).size(13.sp).fontFamily(regular).make(),
          5.heightBox,
          SizedBox(
            width: 200.w,
            child: subtitle!
                .text
                .bold
                .size(12.sp)
                .color(subtitlecolor)
                .fontFamily(regular)
                .make(),
          )
        ],
      )
    ],
  ).box.padding(defaultPadding).make();
}
