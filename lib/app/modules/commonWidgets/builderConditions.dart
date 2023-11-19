import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../appConst/index.dart';

loading() {
  return Center(
      child: SizedBox(
          height: 13.h,
          width: 13.w,
          child: const CircularProgressIndicator(
            color: darkBlue,
            strokeWidth: 2,
          )));
}

errorOcurred() {
  return Center(
    child: errorOccurred.text.make(),
  );
}

collectionEmpty(String? string) {
  return Center(
    child: string.toString().text.make(),
  );
}
