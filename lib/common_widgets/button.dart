import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

String p = 'Poppins';
const purple1 = Color(0xff9F1F63);

Widget MyButton({double? height, double? width, String? name}) {
  height ??= 45;
  width ??= 20.0;

  return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: purple1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            side: const BorderSide(width: .5),
          ),
          onPressed: () {},
          child: name!.text.fontFamily(p).make())
      .box
      .height(height)
      .width(width)
      .roundedFull
      .make();
}
