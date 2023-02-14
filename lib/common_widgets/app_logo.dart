import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget appLogoWidget(double height, double width) {
  return Image.asset('./assets/appLogo.png')
      .box
      .color(Colors.white)
      .size(height, width)
      .padding(const EdgeInsets.all(8))
      .rounded
      .make();
}
