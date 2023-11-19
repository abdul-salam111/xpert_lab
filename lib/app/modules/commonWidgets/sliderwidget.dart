import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../appConst/index.dart';
import '../index.dart';

Widget sliderWidget({required String heading,required String body}) {
  return Expanded(
    child: Padding(
      padding: defaultPadding,
      child: Column(
        mainAxisAlignment: maincenter,
        children: [
          Text(heading,
              style: TextStyle(
                color: whiteColor,
                fontFamily: bold,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5,
                fontSize: 12.sp,
              )),
          2.heightBox,
          Text(body,
              style: TextStyle(
                  fontSize: 12.sp, color: whiteColor, fontFamily: regular))
        ],
      ),
    ),
  );
}
