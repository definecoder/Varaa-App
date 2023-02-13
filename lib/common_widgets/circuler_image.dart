import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget CirculerImage(String fileName, double radius) {
  return CircleAvatar(
    backgroundImage: AssetImage("assets/dp1.png"),
    radius: radius,
  );
}
