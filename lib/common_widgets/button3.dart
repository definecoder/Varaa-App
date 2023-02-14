import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:vaara_app/consts/consts.dart';

String p = 'Poppins';

Widget MyButton3(
    {double? height,
    double? width,
    String? name,
    Function? whenPressed,
    String? imageLoc}) {
  height ??= 50;
  width ??= 20.0;

  return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0.1,
        backgroundColor: Color.fromARGB(229, 211, 211, 211),
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      onPressed: () {
        if (whenPressed != null) {
          whenPressed();
        } else {
          () {};
        }
      },
      child: Row(
        children: [
          Image.asset(
            imageLoc!,
            height: 35,
            width: 35,
          ),
          50.widthBox,
          name!.text.fontFamily(p).make(),
        ],
      )).box.height(height).width(width).roundedFull.make();
}
