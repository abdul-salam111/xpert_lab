import 'package:flutter/material.dart';
import '../../appConst/index.dart';

Widget bgwidget(child) {
  return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(bgImg),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(whiteColor, BlendMode.dstATop))),
      child: child);
}
