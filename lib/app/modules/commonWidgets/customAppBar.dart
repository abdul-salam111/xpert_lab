import 'package:flutter/material.dart';

import '../../appConst/appColors.dart';

AppBar customAppBar({required String titletext, bool?backIcon=false}){
  return AppBar(
    automaticallyImplyLeading: backIcon!,
          backgroundColor: darkBlue,
          title: Text(titletext),
          centerTitle: true,
        );
}