import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:vaara_app/consts/consts.dart';
import 'package:vaara_app/controllers/single_product_loader.dart';
import 'package:vaara_app/controllers/user_controller.dart';
import 'package:vaara_app/screens/home_screen.dart';
import 'package:vaara_app/screens/login_screen.dart';
import 'package:vaara_app/screens/welcome_screen.dart';

import '../controllers/find_user_controller.dart';
import '../controllers/product_controller.dart';

class LoginAuth extends StatelessWidget {
  LoginAuth({super.key});

  var controller = Get.put(ProductController());
  var userController = Get.put(UserController());
  var productLoader = Get.put(SingleProductLoader());
  var productOwnerLoader = Get.put(FindUserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return FutureBuilder(
              future: Future.wait(
                List<Future>.from([
                  controller.loadAllProducts(),
                  userController.loadCurrentUserInfo(),
                ]),
              ),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return HomeScreen();
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            );
          } else {
            return WelcomeScreen();
          }
        },
      ),
    );
  }
}
