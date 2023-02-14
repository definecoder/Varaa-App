import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:vaara_app/common_widgets/app_logo.dart';
import 'package:vaara_app/common_widgets/circuler_image.dart';
import 'package:velocity_x/velocity_x.dart';
import '../common_widgets/button.dart';
import '../common_widgets/button2.dart';
import 'package:velocity_x/velocity_x.dart';

import '../common_widgets/profile_options.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              5.heightBox,
              Row(
                children: [
                  10.widthBox,
                  Transform.scale(
                    scale: 1.5,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_rounded,
                      ),
                      color: Color(0xff9F1F63),
                      onPressed: () {},
                    ),
                  ),
                  10.widthBox,
                  "My Profile"
                      .text
                      .fontFamily('popins')
                      .size(22)
                      .color(Color(0xff9F1F63))
                      .fontWeight(FontWeight.bold)
                      .make(),
                ],
              ),
              30.heightBox,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  40.widthBox,
                  CirculerImage("./assets/dp1.png", 0.17 * context.width),
                  30.widthBox,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Mr. Mehraj"
                          .text
                          .fontFamily('popins')
                          .size(22)
                          .color(Colors.black)
                          .fontWeight(FontWeight.bold)
                          .make(),
                      10.heightBox,
                      "Account Security Level 3"
                          .text
                          .fontFamily('popins')
                          .size(14)
                          .color(Colors.black)
                          .make(),
                    ],
                  ),
                ],
              ),
              10.heightBox,
              Divider(
                color: Colors.grey.shade400,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xff335EF7),
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: EdgeInsets.all(10),
                width: context.width * .8,
                height: context.height * .12,
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      20.widthBox,
                      const Icon(
                        Icons.star,
                        color: Color(0xffF2C94C),
                        size: 55,
                      ),
                      20.widthBox,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          15.heightBox,
                          "Upgrade to Premium"
                              .text
                              .fontFamily('popins')
                              .size(20)
                              .color(Colors.white)
                              .fontWeight(FontWeight.bold)
                              .make(),
                          10.heightBox,
                          "Enjoy full Access of Varaa App"
                              .text
                              .fontFamily('popins')
                              .size(14)
                              .color(Colors.white)
                              .make(),
                        ],
                      )
                    ]),
              ),
              20.heightBox,
              Profile_option(
                bodyText: "Edit Profile",
                usedIcon: Icons.person_rounded,
              ),
              10.heightBox,
              Profile_option(
                bodyText: "Notification",
                usedIcon: Icons.notifications,
              ),
              10.heightBox,
              Profile_option(
                bodyText: "My Rents and Lends",
                usedIcon: Icons.access_alarm_sharp,
              ),
              10.heightBox,
              Profile_option(
                bodyText: "Privacy Policy",
                usedIcon: Icons.lock_person_sharp,
              ),
              10.heightBox,
              Profile_option(
                bodyText: "Help Center",
                usedIcon: Icons.help_center,
              ),
              10.heightBox,
              Profile_option(
                bodyText: "Logout",
                usedIcon: Icons.exit_to_app,
              ),
              10.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}
