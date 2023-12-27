import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast({required ToastState state, required String txt}) {
  Fluttertoast.showToast(
      msg: txt,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: chooseColorToast(state),
      textColor: Colors.white,
      fontSize: 16.0);
}

enum ToastState { SUCCESS, ERROR, WARNING }

Color chooseColorToast(ToastState state) {
  if (state == ToastState.SUCCESS) {
    return Colors.green;
  } else if (state == ToastState.ERROR) {
    return Colors.red;
  } else {
    return Colors.yellow;
  }
  // switch (state) {
  //   case ToastState.SUCCESS:
  //     return color = Colors.green;

  //   case ToastState.ERROR:
  //     return color = Colors.red;
  //   case ToastState.WARNING:
  //     return color = Colors.yellow;
  // }
  // return color;
}
