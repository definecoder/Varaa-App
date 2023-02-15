import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:vaara_app/common_widgets/single_notification.dart';
import 'package:vaara_app/screens/post_new_product.dart';
import 'package:velocity_x/velocity_x.dart';

import '../common_widgets/BottomBar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          20.heightBox,
          Row(
            children: [
              30.widthBox,
              "Notifications"
                  .text
                  .fontFamily("popins")
                  .color(Color(0xff9F1F63))
                  .fontWeight(FontWeight.bold)
                  .size(24)
                  .make(),
              Expanded(
                child: Container(child: 10.heightBox),
              ),
              const Icon(
                Icons.notifications,
                color: Color(0xff9F1F63),
                size: 40,
              ),
              30.widthBox,
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(children: [
                20.heightBox,
                SingleNotification(
                    notificationBody:
                        "Your add “Camp Tent” got 2 rent requests! Review now before you miss out."),
                SingleNotification(
                    notificationBody:
                        "Your add “Camp Tent” got 2 rent requests! Review now before you miss out."),
                SingleNotification(
                    notificationBody:
                        "Your add “Camp Tent” got 2 rent requests! Review now before you miss out."),
                SingleNotification(
                    notificationBody:
                        "Your add “Camp Tent” got 2 rent requests! Review now before you miss out."),
                SingleNotification(
                    notificationBody:
                        "Your add “Camp Tent” got 2 rent requests! Review now before you miss out."),
                SingleNotification(
                    notificationBody:
                        "Your add “Camp Tent” got 2 rent requests! Review now before you miss out."),
                SingleNotification(
                    notificationBody:
                        "Your add “Camp Tent” got 2 rent requests! Review now before you miss out."),
                SingleNotification(
                    notificationBody:
                        "Your add “Camp Tent” got 2 rent requests! Review now before you miss out."),
                SingleNotification(
                    notificationBody:
                        "Your add “Camp Tent” got 2 rent requests! Review now before you miss out."),
              ]),
            ),
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(PostNewProduct());
        },
        elevation: 5,
        backgroundColor: Color(0xff9F1F63),
        child: Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(
        curScene: 3, // 1 = home, 2 = my rents, 3 = notifications, 4 = profile
      ),
    );
  }
}
