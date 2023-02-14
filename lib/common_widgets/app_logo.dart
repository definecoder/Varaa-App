import 'package:flutter/material.dart';
import 'package:vaara_app/consts/consts.dart';

Widget appLogoWidget(double height, double width) {
  return Image.asset(applogo)
      .box
      .color(Colors.transparent)
      .size(height, width)
      .padding(const EdgeInsets.all(8))
      .rounded
      .make();
}
