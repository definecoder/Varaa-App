import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:vaara_app/screens/home_screen.dart';
import 'package:vaara_app/screens/notifications_screen.dart';
import 'package:vaara_app/screens/profile_screen.dart';
import "package:velocity_x/velocity_x.dart";
import 'package:get/get.dart';

import '../screens/my_lends_rents.dart';

class BottomBar extends StatelessWidget {
  int curScene;
  String email;

  BottomBar({this.curScene = 1, this.email = "null"}) {}

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      color: Color(0xff9F1F63),
      elevation: 10,
      child: IconTheme(
        data: IconThemeData(
          color: Colors.white,
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          IconButton(
            tooltip: 'Go to home',
            icon: const Icon(Icons.home),
            color: curScene == 1 ? Colors.lime : Colors.white,
            onPressed: () {
              print(email);
              if (curScene != 1) Get.to(() => HomeScreen());
            },
          ),
          IconButton(
            tooltip: 'My Rents and lends',
            icon: const Icon(Icons.history),
            color: curScene == 2 ? Colors.lime : Colors.white,
            onPressed: () {
              print(email);
              if (curScene != 2) Get.to(MyLendsRents());
            },
          ),
          20.widthBox,
          //const Spacer(),
          IconButton(
            tooltip: 'Notifications',
            icon: const Icon(Icons.notifications),
            color: curScene == 3 ? Colors.lime : Colors.white,
            onPressed: () {
              print(email);
              if (curScene != 3) Get.to(NotificationScreen());
            },
          ),
          IconButton(
            tooltip: 'My Profile',
            icon: const Icon(Icons.person),
            color: curScene == 4 ? Colors.lime : Colors.white,
            onPressed: () {
              print(email);
              if (curScene != 4) Get.to(ProfileScreen());
            },
          ),
        ]),
      ),
    );
  }
}
