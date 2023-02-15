import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:vaara_app/common_widgets/Button_bold_big.dart';
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
              padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: Row(
                children: [
                  Container(
                    //color: Colors.grey,
                    decoration: BoxDecoration(
                      border: Border.all(color: purple1, width: 3),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Icon(
                      Icons.location_on,
                      size: 35,
                      color: purple1,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    width: context.width * .7,
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "Address".text.size(16).semiBold.make(),
                        const ExpandableText(
                          "148/D Hi Rise Garden view Khulsi Green H/S 148/D Hi Rise Garden view Khulsi Green H/S 148/D Hi Rise Garden view Khulsi Green H/S 148/D Hi Rise Garden view Khulsi Green H/S",
                          expandText: 'show more',
                          collapseText: 'show less',
                          style: TextStyle(fontFamily: "Popins", fontSize: 14),
                          maxLines: 2,
                          linkColor: purple1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Container(
                            //color: Colors.grey,
                            decoration: BoxDecoration(
                              border: Border.all(color: purple1, width: 3),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Icon(
                              Icons.question_mark_rounded,
                              size: 35,
                              color: purple1,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Column(
                              children: [
                                "Product".text.size(16).semiBold.make(),
                                "Condition".text.size(16).semiBold.make(),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                        alignment: Alignment.centerLeft,
                        //color: purple1,
                        child: "Excelent"
                            .text
                            .align(TextAlign.left)
                            .color(Color.fromARGB(255, 40, 131, 43))
                            .size(20)
                            .fontWeight(FontWeight.w700)
                            .make(),
                      )
                    ],
                  ),
                  Expanded(child: Container()),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                "Contact".text.size(16).semiBold.make(),
                                "+8801913112522".text.size(16).make(),
                              ],
                            ),
                          ),
                          Container(
                            //color: Colors.grey,
                            decoration: BoxDecoration(
                              border: Border.all(color: purple1, width: 3),
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Icon(
                              Icons.phone,
                              size: 35,
                              color: purple1,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                        child: "Click to copy phone number".text.make(),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  "Product Description"
                      .text
                      .bold
                      .color(purple1)
                      .size(22)
                      .make(),
                  const ExpandableText(
                    "This is SUN camp tent. This can save you from sun, rain and snow This is SUN camp tent. This can save you from sun, rain and snow This is SUN camp tent. This can save you from sun, rain and snow This is SUN camp tent. This can save you from sun, rain and snow This is SUN camp tent. This can save you from sun, rain and snow",
                    expandText: 'show more',
                    collapseText: 'show less',
                    style: TextStyle(
                        fontFamily: "Popins",
                        fontSize: 17,
                        color: Color.fromARGB(123, 0, 0, 0)),
                    maxLines: 3,
                    linkColor: purple1,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: BigButton(
                  name: "PROCEED TO RENT",
                  width: 250,
                  height: 45,
                  font_size: 22),
            ),
          ],
        ),
      ),
    );
  }
}
