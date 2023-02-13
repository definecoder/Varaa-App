import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

String p = 'Poppins';
const purple1 = Color(0xff9F1F63);

Widget MyButton() {
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: purple1,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      onPressed: () {},
      child: "Sign up".text.fontFamily(p).make());
}
