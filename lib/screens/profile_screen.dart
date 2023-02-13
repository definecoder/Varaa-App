import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:vaara_app/common_widgets/app_logo.dart';
import 'package:velocity_x/velocity_x.dart';
import '../common_widgets/button.dart';
import '../common_widgets/button2.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              5.heightBox,
              Row(
                children: [
                  10.widthBox,
                  Transform.scale(
                    scale: 1.5,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_rounded,
                      ),
                      color: Color(0xff9F1F63),
                      onPressed: () {},
                    ),
                  ),
                  10.widthBox,
                  "My Profile"
                      .text
                      .fontFamily('popins')
                      .size(22)
                      .color(Color(0xff9F1F63))
                      .fontWeight(FontWeight.bold)
                      .make(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
