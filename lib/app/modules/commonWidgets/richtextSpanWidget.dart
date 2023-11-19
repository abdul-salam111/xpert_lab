import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../appConst/index.dart';

TextSpan spanWidgetBold({required String text,}) {
  return TextSpan(
      text: text,
      style: TextStyle(
          color: darkBlue,
          fontWeight: FontWeight.bold,
          fontFamily: regular,
          fontSize: 12.sp));
}

TextSpan spanWidgetSimple({required String text,}) {
  return TextSpan(
      text: text,
      style: TextStyle(
          color: darkBlue,
        
          fontFamily: regular,
          fontSize: 12.sp));
}
