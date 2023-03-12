import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget CirculerImage(String fileName, double radius) {
  return CircleAvatar(
    backgroundImage: NetworkImage(fileName),
    radius: radius,
  );
}
