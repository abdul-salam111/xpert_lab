import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../appConst/index.dart';

Widget mainAppLogo() {
  return Align(
    alignment: Alignment.center,
    child: Image.asset(
      appLogo,
      width: 200.w,
      height: 100.h,
    ),
  );
}
Widget mainAppLogoforReport() {
  return Image.asset(
    appLogo,
    width: 180.w,
    height: 80.h,
    fit: BoxFit.fill,
  );
 
}
