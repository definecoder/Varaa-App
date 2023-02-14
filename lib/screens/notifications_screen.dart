import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
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
              Icon(
                Icons.notifications,
                color: Color(0xff9F1F63),
                size: 40,
              ),
              30.widthBox,
            ],
          ),
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
