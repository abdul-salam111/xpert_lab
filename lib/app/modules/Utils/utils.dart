import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static showToast({required String msg, required Color bgcolor}) {
    Fluttertoast.showToast(
        msg: msg, backgroundColor: bgcolor, gravity: ToastGravity.TOP);
  }
}
