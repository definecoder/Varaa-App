import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vaara_app/common_widgets/app_logo.dart';
import 'package:vaara_app/screens/login_screen.dart';
import 'package:velocity_x/velocity_x.dart';
import '../common_widgets/button.dart';
import '../common_widgets/button2.dart';
import './signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: context.width,
        height: context.height,
        color: Colors.white,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                100.heightBox,
                appLogoWidget(200, 200),
                50.heightBox,
                "Welcome"
                    .text
                    .fontFamily('Poppins')
                    .black
                    .size(40)
                    .fontWeight(FontWeight.bold)
                    .make(),
                10.heightBox,
                "Rent everything".text.color(Colors.blueGrey).size(20).make(),
                "near you...".text.color(Colors.blueGrey).size(20).make(),
                100.heightBox,
                MyButton(
                  name: 'Sign up',
                  width: context.width - 70,
                  whenPressed: () {
                    Get.to(() => const SignUpScreen());
                  },
                ),
                20.heightBox,
                MyButton2(
                    name: 'Sign in',
                    width: context.width - 70,
                    whenPressed: () {
                      Get.to(() => const LoginScreen());
                    }),
                20.heightBox,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
