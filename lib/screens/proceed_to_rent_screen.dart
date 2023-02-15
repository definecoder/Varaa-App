import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:vaara_app/common_widgets/Button_bold_big.dart';
import 'package:vaara_app/common_widgets/app_logo.dart';
import 'package:vaara_app/common_widgets/button.dart';
import 'package:vaara_app/common_widgets/button2.dart';
import 'package:vaara_app/common_widgets/circuler_image.dart';
import 'package:vaara_app/consts/consts.dart';
import 'package:vaara_app/screens/home_screen.dart';

class ProceedRentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Center(
                    child: appLogoWidget(
                        context.width * 0.35, context.width * 0.35),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: Color(0xff9F1F63),
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
              5.heightBox,
              Center(
                child: "Rent request successful"
                    .text
                    .size(24)
                    .color(Color.fromARGB(197, 43, 42, 42))
                    .bold
                    .make(),
              ),
              Padding(
                padding: EdgeInsets.all(context.width * 0.07),
                child: Row(
                  children: [
                    15.widthBox,
                    Column(
                      children: [
                        CirculerImage("./assets/dp1.png", context.width * 0.12),
                        Container(
                          padding: EdgeInsets.all(7),
                          child: MyButton(height: 20, width: 60, name: "PRO"),
                        ),
                      ],
                    ),
                    Expanded(child: Container()),
                    Container(
                      width: context.width * .5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          "Renter"
                              .text
                              .bold
                              .size(16)
                              .color(Color(0xff9F1F63))
                              .make(),
                          "Mehrajul Islam"
                              .text
                              .align(TextAlign.right)
                              .size(22)
                              .semiBold
                              .make(),
                          "Level 3".text.align(TextAlign.right).make(),
                          "+8801913112522"
                              .text
                              .align(TextAlign.right)
                              .size(17)
                              .semiBold
                              .make(),
                        ],
                      ),
                    ),
                    15.widthBox,
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(35, 0, 35, 25),
                child: Center(
                  child:
                      "The renter has been notified and given your information. Meanwhile you can :"
                          .text
                          .size(16)
                          .align(TextAlign.center)
                          .color(Color.fromARGB(197, 43, 42, 42))
                          .semiBold
                          .make(),
                ),
              ),
              BigButton(
                  name: "CALL NOW", height: 50, width: 180, font_size: 20),
              Container(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                child: "or"
                    .text
                    .size(20)
                    .align(TextAlign.center)
                    .color(Color.fromARGB(197, 43, 42, 42))
                    .semiBold
                    .make(),
              ),
              BigButton(
                  name: "CHAT NOW", height: 50, width: 180, font_size: 20),
              Container(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 5),
                child: "Thanks for using Varaa"
                    .text
                    .size(16)
                    .align(TextAlign.center)
                    .color(Color.fromARGB(197, 43, 42, 42))
                    .semiBold
                    .make(),
              ),
              //Expanded(child: Container()),
              35.heightBox,
              Container(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 25),
                child: MyButton2(
                  name: "Continue to Varaa",
                  height: 50,
                  width: context.width * 0.75,
                  whenPressed: () {
                    Get.to(HomeScreen());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
