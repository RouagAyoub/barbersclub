import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void changepage(BuildContext context, Widget widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

void changeremplacepage(BuildContext context, Widget widget) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => widget));
}

void changewithargument(BuildContext context, Widget widget, Map map) {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => widget,
          settings: RouteSettings(arguments: map)));
}
