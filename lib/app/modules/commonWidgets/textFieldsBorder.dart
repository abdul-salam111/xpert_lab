import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../appConst/index.dart';

var enableborder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(30.r),
    borderSide: const BorderSide(color: darkBlue, width: 1));
var focusborder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(30.r),
    borderSide: const BorderSide(color: darkBlue, width: 2));
var enableborderRec = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5.r),
    borderSide: const BorderSide(color: darkBlue, width: 1));
var focusborderRec = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5.r),
    borderSide: const BorderSide(color: darkBlue, width: 2));
var errorborder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(30.r),
    borderSide: const BorderSide(color: redColor, width: 1));
var errorBorderRec = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5.r),
    borderSide: const BorderSide(color: redColor, width: 1));