import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:vaara_app/screens/profile_screen.dart';
import '../common_widgets/button.dart';

import '../common_widgets/button_next.dart';
import '../common_widgets/custom_textfield.dart';
import '../consts/consts.dart';
import './profile_screen.dart';

class PostNewProduct2 extends StatelessWidget {
  PostNewProduct2();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                5.heightBox,
                Row(
                  children: [
                    10.widthBox,
                    CupertinoNavigationBarBackButton(
                      color: Color(0xff9F1F63),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    "Add Product Information"
                        .text
                        .fontFamily('popins')
                        .size(22)
                        .color(Color(0xff9F1F63))
                        .fontWeight(FontWeight.bold)
                        .make(),
                  ],
                ),
                20.heightBox,
                Container(
                  width: double.infinity,
                  height: context.height * 0.62,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomTextField(
                          title: 'Product Rent', hint: 'Add product rent'),
                      CustomTextField(
                          title: 'Rent Frequency',
                          hint: 'Choose rent frequency'),
                      CustomTextField(
                          title: 'Address',
                          hint: 'Enter Product Address',
                          isBig: true),
                      CustomTextField(title: 'City', hint: 'Choose city'),
                    ],
                  ).box.rounded.padding(EdgeInsets.all(19)).make(),
                ),
                Expanded(child: Container()),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  NextButton(
                      height: 40,
                      width: 135,
                      name: "POST RENT",
                      whenPressed: () {
                        Get.to(ProfileScreen());
                      }),
                  20.widthBox
                ]),
                20.heightBox
              ],
            ),
          ),
        ),
      ),
    );
  }
}
