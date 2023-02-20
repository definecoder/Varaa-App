import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vaara_app/common_widgets/app_logo.dart';
import 'package:vaara_app/common_widgets/bg_widget.dart';
import 'package:get/get.dart';
import 'package:vaara_app/common_widgets/button.dart';
import 'package:vaara_app/common_widgets/custom_textfield.dart';
import 'package:vaara_app/screens/finish_signup_screen.dart';
import 'package:vaara_app/screens/welcome_screen.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/cupertino.dart';
import 'package:vaara_app/consts/consts.dart';
import 'package:velocity_x/velocity_x.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const purple1 = Color(0xff9F1F63);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final String p = 'Poppins';
  var _termsChecked = false;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        // appBar: AppBar(title: Text('Hi')),

        child: SingleChildScrollView(
          child: Center(
            child: Column(children: [
              Row(
                children: [
                  10.widthBox,
                  Align(
                    alignment: Alignment.topLeft,
                    child: CupertinoNavigationBarBackButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      color: SignUpScreen.purple1,
                    ),
                  ),
                ],
              ),
              20.heightBox,
              appLogoWidget(150, 150),
              10.heightBox,
              "Create Account".text.fontFamily(p).size(30).bold.make(),
              20.heightBox,
              Column(
                children: [
                  CustomTextField(
                      title: 'Email',
                      hint: 'Enter your email',
                      textController: _emailController),
                  CustomTextField(
                      title: 'Password',
                      hint: 'Create a password',
                      textController: _passwordController,
                      isPass: true),
                  CustomTextField(
                      title: 'Confirm Password',
                      hint: 'Confirm your password',
                      textController: _confirmPasswordController,
                      isPass: true),
                ],
              ).box.rounded.padding(EdgeInsets.all(19)).make(),
              CheckboxListTile(
                title: const Text("I agree to the terms and conditions"),
                value: _termsChecked,
                onChanged: (value) {
                  setState(() {
                    _termsChecked = value!;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,
                activeColor: SignUpScreen.purple1,
                checkboxShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
              ),
              MyButton(
                name: 'Create Account',
                whenPressed: () {
                  try {
                    if (_passwordController.text.trim() ==
                            _confirmPasswordController.text.trim() &&
                        _termsChecked &&
                        _passwordController.text.isNotEmpty &&
                        _emailController.text.isNotEmpty) {
                      Get.to(() => FinishSignup(
                          email: _emailController.text,
                          password: _passwordController.text));
                    } else {
                      if (_emailController.text.isEmpty) {
                        VxToast.show(
                          context,
                          msg: 'Please enter email',
                          position: VxToastPosition.center,
                          bgColor: purple1,
                          textSize: 20,
                          textColor: whiteColor,
                        );
                      }
                      if (_passwordController.text.isEmpty) {
                        VxToast.show(
                          context,
                          msg: 'Please enter password',
                          position: VxToastPosition.center,
                          bgColor: purple1,
                          textSize: 20,
                          textColor: whiteColor,
                        );
                      }
                      if (_passwordController.text.trim() !=
                          _confirmPasswordController.text.trim()) {
                        VxToast.show(
                          context,
                          msg: 'Password Did not matched!',
                          position: VxToastPosition.center,
                          bgColor: purple1,
                          textSize: 20,
                          textColor: whiteColor,
                        );
                      }

                      if (!_termsChecked) {
                        VxToast.show(
                          context,
                          msg: 'you have to agree with terms and condition',
                          position: VxToastPosition.center,
                          bgColor: purple1,
                          textSize: 20,
                          textColor: whiteColor,
                        );
                      }
                    }
                  } catch (e) {
                    VxToast.show(
                      context,
                      msg: e.toString(),
                      position: VxToastPosition.center,
                      bgColor: purple1,
                      textSize: 20,
                      textColor: whiteColor,
                    );
                  }
                },
                width: context.width - 70,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  "Have an account? "
                      .text
                      .make()
                      .box
                      .padding(EdgeInsets.symmetric(vertical: 8))
                      .make(),
                  TextButton(
                      onPressed: () {},
                      child: const Text('login'),
                      style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all(purple1))),
                ],
              )
            ]),
          ),
        ),
      ),
    ));
  }
}
