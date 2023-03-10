import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vaara_app/common_widgets/bg_widget.dart';
import 'package:vaara_app/common_widgets/button.dart';
import 'package:vaara_app/common_widgets/custom_textfield.dart';
import 'package:vaara_app/consts/consts.dart';
import 'package:vaara_app/controllers/user_controller.dart';
import 'package:vaara_app/data_classes/product.dart';
import 'package:vaara_app/firebase_classes/login_auth.dart';
import 'package:vaara_app/screens/home_screen.dart';
import 'package:vaara_app/screens/welcome_screen.dart';

import '../common_widgets/button3.dart';
import '../controllers/product_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  var controller = Get.find<ProductController>();
  var userController = Get.find<UserController>();

  bool isLoading = false;
  bool exceptionCaught = false;

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      VxToast.show(
        context,
        msg: e.toString(),
        position: VxToastPosition.center,
        bgColor: purple1,
        textSize: 20,
        textColor: whiteColor,
      );
      print('ino aise');
      Get.to(() => WelcomeScreen());
      setState(() {
        exceptionCaught = true;
      });
    }
  }

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
                      CustomTextField(
                          title: 'Email',
                          hint: 'Enter your email',
                          textController: _emailController),
                      CustomTextField(
                          title: 'Password',
                          hint: 'Enter your password',
                          textController: _passwordController,
                          isPass: true),
                    ],
                  ).box.rounded.padding(EdgeInsets.all(19)).make(),
                  30.heightBox,
                  isLoading
                      ? CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(redColor),
                        )
                      : MyButton(
                          name: 'Login',
                          width: context.width - 70,
                          whenPressed: () async {
                            setState(() {
                              isLoading = true;
                            });

                            if (_emailController.text.isNotEmpty &&
                                _passwordController.text.isNotEmpty) {
                              await signIn();

                              if (!exceptionCaught) {
                                await controller.loadAllProducts();
                                await userController.loadCurrentUserInfo();
                                setState(() {
                                  isLoading = false;
                                });
                                Get.to(() => LoginAuth());
                              }
                            } else {
                              if (_emailController.text.isEmpty) {
                                VxToast.show(
                                  context,
                                  msg: 'Please enter your email',
                                  position: VxToastPosition.center,
                                  bgColor: purple1,
                                  textSize: 20,
                                  textColor: whiteColor,
                                );
                              } else if (_passwordController.text.isEmpty) {
                                VxToast.show(
                                  context,
                                  msg: 'Please enter your password',
                                  position: VxToastPosition.center,
                                  bgColor: purple1,
                                  textSize: 20,
                                  textColor: whiteColor,
                                );
                              }
                            }

                            setState(() {
                              isLoading = false;
                            });

                            print(_emailController.text +
                                _passwordController.text);
                          },
                        ),
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
