import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vaara_app/common_widgets/bg_widget.dart';
import 'package:vaara_app/common_widgets/button.dart';
import 'package:vaara_app/common_widgets/custom_textfield.dart';
import 'package:vaara_app/consts/consts.dart';

import '../common_widgets/button3.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BgWidget(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(color: purple1),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  10.heightBox,
                  "Welcome Back!".text.fontFamily(poppins).size(30).make(),
                  "Sign in to continue!"
                      .text
                      .fontFamily(poppins)
                      .size(30)
                      .make(),
                  40.heightBox,
                  MyButton3(
                      name: 'Login with Google',
                      width: context.width - 70,
                      whenPressed: () {},
                      imageLoc: 'assets/google.png'),
                  20.heightBox,
                  MyButton3(
                    name: 'Login with Facebook',
                    width: context.width - 70,
                    whenPressed: () {},
                    imageLoc: 'assets/facebook.png',
                  ),
                  30.heightBox,
                  "Or".text.fontFamily(poppins).make(),
                  11.heightBox,
                  Column(
                    children: [
                      CustomTextField(title: 'Email', hint: 'Enter your email'),
                      CustomTextField(
                          title: 'Password', hint: 'Enter your password'),
                    ],
                  ).box.rounded.padding(EdgeInsets.all(19)).make(),
                  30.heightBox,
                  MyButton(
                      name: 'Login',
                      width: context.width - 70,
                      whenPressed: () {}),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot Password',
                        style: TextStyle(color: purple1),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
