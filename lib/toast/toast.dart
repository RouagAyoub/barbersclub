import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(message, colores) {
  FlutterToast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: colores,
      textColor: Colors.black,
      fontSize: 16.0);
}

/*
void nketoast(String message) {
  message = message.substring(message.indexOf('['), message.indexOf(']'));
  FlutterToast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: Colors.red,
      textColor: Colors.black,
      fontSize: 16.0);
}
*/
