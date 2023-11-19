import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:xpert_lab/app/appConst/index.dart';

Widget navBarIcon({required String iconName}) {
  return Image.asset(
    iconName,
    width: 25.w,
    height: 20.h,
    fit: BoxFit.contain,
    color: darkBlue,
  );
}
