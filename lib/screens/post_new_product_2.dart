import 'package:chips_choice/chips_choice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:vaara_app/screens/home_screen.dart';
import 'package:vaara_app/screens/profile_screen.dart';
import '../common_widgets/button.dart';

import '../common_widgets/button_next.dart';
import '../common_widgets/custom_textfield.dart';
import '../consts/consts.dart';
import './profile_screen.dart';

class PostNewProduct2 extends StatefulWidget {
  PostNewProduct2();

  @override
  State<PostNewProduct2> createState() => _PostNewProduct2State();
}

class _PostNewProduct2State extends State<PostNewProduct2> {
  final user = FirebaseAuth.instance.currentUser!;
  List<String> options = [
    'Daily',
    'Weekly',
    'Monthly',
    'Yearly',
  ];
  int tag2 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: SizedBox(
            height: context.height,
            width: context.width,
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                10.widthBox,
                                "Choose rent frequency"
                                    .text
                                    .bold
                                    .size(18)
                                    .make(),
                              ],
                            ),
                            5.heightBox,
                            ChipsChoice.single(
                              value: tag2,
                              onChanged: (val) => setState(() => tag2 = val),
                              choiceItems: C2Choice.listFrom(
                                source: options,
                                value: (i, v) => i,
                                label: (i, v) => v,
                              ),
                            ),
                          ],
                        ),
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
                          Get.to(HomeScreen());
                        }),
                    20.widthBox
                  ]),
                  20.heightBox
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
