import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget appLogoWidget(double height, double width) {
  return Image.asset('./assets/appLogo.png')
      .box
      .white
      .size(height, width)
      .padding(EdgeInsets.all(8))
      .rounded
      .make();
}
