import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            120.heightBox,
            Image.asset('./assets/logo-2.png')
                .box
                .size(context.width * 0.5, context.height * 0.25)
                .make(),
            Text("Welcome"),
          ],
        ),
      ),
    );
  }
}
