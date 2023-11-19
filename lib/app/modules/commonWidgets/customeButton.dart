import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../appConst/index.dart';

Widget customButton(
  
    {required onPress,
    required String btnName,
    Color bgColor = bluesh,
    Color textcolor = whiteColor,
    Size? btnSize}) {
  return ElevatedButton(
    onPressed: onPress,
    style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        backgroundColor: bgColor,
        minimumSize: btnSize),
    child: btnName.text
        .color(textcolor)
        .letterSpacing(0.5)
        .wordSpacing(0.5)
        .size(17.sp)
        .semiBold
        .fontFamily(regular)
        .make(),
  );
}

Widget customButtonOutlined(
    {required onPress,
    required String btnName,
    Color textcolor = whiteColor,
    Color borderColor = redColor,
    int?textSize=17,
    Size? btnSize}) {
  return OutlinedButton(
    onPressed: onPress,
    style: OutlinedButton.styleFrom(
        side: BorderSide(color: borderColor),
        foregroundColor: redColor,
        minimumSize: btnSize),
    child: btnName.text
        .color(textcolor)
        .letterSpacing(0.5)
        .wordSpacing(0.5)
        .size(textSize!.sp)
        .semiBold
        .fontFamily(regular)
        .make(),
  );
}
Widget customButtonRec(
  
    {required onPress,
    required String btnName,
    Color bgColor = bluesh,
    Color textcolor = whiteColor,
    Size? btnSize}) {
  return ElevatedButton(

    onPressed: onPress,
    style: ElevatedButton.styleFrom(
     
        backgroundColor: bgColor,
        minimumSize: btnSize),
    child: btnName.text
        .color(textcolor)     
        .size(15.sp)
    
        .fontFamily(regular)
        .make(),
  );
}