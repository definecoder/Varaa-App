import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:vaara_app/common_widgets/single_notification.dart';
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
          20.heightBox,
          SingleNotification(notificationBody: "Welcome to Bangladesh"),
          SingleNotification(notificationBody: "Welcome to Sylhet"),
          SingleNotification(notificationBody: "Welcome to SUST"),
          SingleNotification(notificationBody: "Welcome to IICT"),
          SingleNotification(notificationBody: "Welcome to SWE"),
          SingleNotification(notificationBody: "Welcome to Varaa App"),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
