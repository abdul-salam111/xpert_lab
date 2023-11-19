import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:xpert_lab/app/modules/commonWidgets/alignment.dart';

import '../../appConst/index.dart';

Widget loadingWidget({String? text, value}) {
  return Visibility(
      visible: value,
      child: Center(
        child: Column(
            crossAxisAlignment: crosscenter,
            mainAxisAlignment: maincenter,
            children: [
              text!.text.bold.fontFamily(regular).make(),
              5.heightBox,
              const CircularProgressIndicator(
                color: darkBlue,
              ),
            ]).box.white.roundedSM.padding(defaultPadding).border(color: darkBlue).make(),
      )).box.height(100.h).makeCentered();
}
