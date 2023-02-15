import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:vaara_app/common_widgets/button.dart';
import 'package:vaara_app/common_widgets/button2.dart';
import 'package:vaara_app/common_widgets/circuler_image.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24)),
                  child: Container(
                    width: double.infinity,
                    height: context.height * 0.4,
                    child: Opacity(
                      opacity: 0.85,
                      child: Image.asset(
                        './assets/tent_nature.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    10.widthBox,
                    IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        size: 30,
                      ),
                    ),
                  ],
                )
              ],
            ),
            //10.heightBox,
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              10.widthBox,
              Container(
                padding: EdgeInsets.all(10),
                width: context.width * 0.55,
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "Camp Tent"
                        .text
                        .size(28)
                        .fontWeight(FontWeight.w500)
                        .fontFamily('Popins')
                        .make(),
                    Container(
                      padding: EdgeInsets.all(2),
                      width: context.width * 0.5,
                      child: "৳ 250 per day"
                          .text
                          .size(20)
                          .semiBold
                          .color(purple1)
                          .make(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.location_on),
                        Container(
                          width: context.width * 0.4,
                          child: "Sylhet".text.size(18).make(),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Expanded(child: Container()),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: context.width * 0.21,
                    child: "Mr. Mehraj"
                        .text
                        .align(TextAlign.end)
                        .size(17)
                        .bold
                        .fontFamily('Popins')
                        .make(),
                  ),
                  "Level 3".text.size(14).make(),
                  //3.heightBox,
                  Container(
                      padding: EdgeInsets.all(7),
                      child: MyButton(height: 20, width: 60, name: "PRO")),
                ],
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    10.heightBox,
                    CirculerImage("./assets/dp1.png", context.width * .08),
                    10.heightBox,
                  ],
                ),
              ),
            ]),
            Container(
              padding: const EdgeInsets.all(20),
              child: const ExpandableText(
                "amar sonar bangla ami tomay valo bashi ki akash ki batash amar prane bajay bashi amar sonar bangla ami tomay valo bashi ki akash ki batash amar prane bajay bashi amar sonar bangla ami tomay valo bashi ki akash ki batash amar prane bajay bashi",
                expandText: 'show more',
                collapseText: 'show less',
                style: TextStyle(fontFamily: "Popins", fontSize: 17),
                maxLines: 3,
                linkColor: purple1,
              ),
            )
          ],
        ),
      ),
    );
  }
}
