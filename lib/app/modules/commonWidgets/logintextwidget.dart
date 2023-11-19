import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../appConst/index.dart';
import '../../routes/app_pages.dart';

Widget logintext(String?text1,String?text2){
  return  GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.SIGN_UP);
                          },
                          child: Center(
                            child: RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text: text1,
                                  style: TextStyle(
                                      color: darkBlue,
                                      fontFamily: regular,
                                      fontSize: 15.sp)),
                              TextSpan(
                                  text: text2,
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color: bluesh,
                                      fontFamily: regular,
                                      fontWeight: FontWeight.w500)),
                            ])),
                          ),
                        );
}