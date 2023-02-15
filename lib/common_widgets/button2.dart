import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

String p = 'Poppins';
const purple1 = Color(0xff9F1F63);

Widget MyButton2(
    {double? height, double? width, String? name, Function? whenPressed}) {
  height ??= 45;
  width ??= 20.0;

  return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: purple1,
            shadowColor: purple1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
              side: const BorderSide(width: .5),
            ),
          ),
          onPressed: () {
            if (whenPressed != null)
              whenPressed();
            else
              () {};
          },
          child: name!.text.fontFamily(p).size(16).letterSpacing(0).make())
      .box
      .height(height)
      .width(width)
      .roundedFull
      .make();
}
