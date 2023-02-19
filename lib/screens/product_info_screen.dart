import 'package:expandable_text/expandable_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:vaara_app/common_widgets/Button_bold_big.dart';
import 'package:vaara_app/common_widgets/button.dart';
import 'package:vaara_app/common_widgets/button2.dart';
import 'package:vaara_app/common_widgets/circuler_image.dart';
import 'package:vaara_app/controllers/single_product_loader.dart';
import 'package:vaara_app/screens/proceed_to_rent_screen.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductInfoScreen extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;
  String pid;
  var productLoader, productOwnerLoader;

  ProductInfoScreen(
      {required this.pid,
      this.productLoader,
      required this.productOwnerLoader}) {
    //productLoader = Get.find<SingleProductLoader>();
    //productLoader.loadProductById(pid).then((hi) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
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
                        child: Image.network(
                          productLoader.curProduct!.imgLocation,
                          fit: BoxFit.cover,
                          //'./assets/tent_nature.png',
                          //fit: BoxFit.cover,
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
                      /*(productLoader.curProduct!).title
                          .text
                          .size(28)
                          .fontWeight(FontWeight.w500)
                          .fontFamily('Popins')
                          .make(),*/
                      Text(
                        productLoader.curProduct!.title,
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Popins',
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(2),
                        width: context.width * 0.5,
                        child: Text(
                          "৳ " +
                              productLoader.curProduct!.price +
                              " " +
                              productLoader.curProduct!.frequency,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: purple1,
                            fontFamily: 'Popins',
                          ),
                        ),
                        /*"৳ 250 per day"
                            .text
                            .size(20)
                            .semiBold
                            .color(purple1)
                            .make(),*/
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.location_on),
                          Container(
                            width: context.width * 0.4,
                            child: Text(
                              productLoader.curProduct!.location,
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            /*productLoader.curProduct!.location.text
                                .size(18)
                                .make(),*/
                          )
                        ],
                      )
                    ],
                  ),
                ),
                //Expanded(child: Container()),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: context.width * 0.21,
                      child: Text(
                        productOwnerLoader.currentUser.username,
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Popins',
                        ),
                      ),
                      /*"Mr. Mehraj"
                          .text
                          .align(TextAlign.end)
                          .size(17)
                          .bold
                          .fontFamily('Popins')
                          .make(),*/
                    ),
                    "Level 3".text.size(14).make(),
                    //3.heightBox,
                    Container(
                        padding: EdgeInsets.all(7),
                        child: MyButton(height: 20, width: 60, name: "PRO")),
                  ],
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                  child: Column(
                    children: [
                      10.heightBox,
                      CirculerImage(productOwnerLoader.currentUser.imageUrl,
                          context.width * .08),
                      10.heightBox,
                    ],
                  ),
                ),
              ]),
              Container(
                padding: EdgeInsets.fromLTRB(20, 15, 20, 20),
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
                        size: 40,
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
                          ExpandableText(
                            productLoader.curProduct!.address,
                            expandText: 'show more',
                            collapseText: 'show less',
                            style:
                                TextStyle(fontFamily: "Popins", fontSize: 14),
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
                padding: EdgeInsets.fromLTRB(20, 5, 20, 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                size: 40,
                                color: purple1,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  "Product".text.size(18).semiBold.make(),
                                  "Condition".text.size(18).semiBold.make(),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                          alignment: Alignment.centerLeft,
                          //color: purple1,
                          child: Text(
                            productLoader.curProduct!.condition,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'Popins',
                              color: Color.fromARGB(255, 40, 131, 43),
                            ),
                          ),
                          /*productLoader.curProduct!.condition.text
                              .align(TextAlign.left)
                              .color(Color.fromARGB(255, 40, 131, 43))
                              .size(22)
                              .fontWeight(FontWeight.w700)
                              .make(),*/
                        )
                      ],
                    ),
                    Expanded(child: Container()),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  "Contact".text.size(18).semiBold.make(),
                                  Text(
                                    productOwnerLoader.currentUser.phone_number,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  //"+8801913112522".text.size(16).make(),
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
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          width: context.width * 0.43,
                          child: "Click here to copy phone number"
                              .text
                              .align(TextAlign.right)
                              .make(),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        "Product Description"
                            .text
                            .bold
                            .color(purple1)
                            .size(22)
                            .make(),
                        Expanded(child: Container()),
                      ],
                    ),
                    5.heightBox,
                    ExpandableText(
                      productLoader.curProduct!.address,
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
                    font_size: 22,
                    whenPressed: () {
                      Get.to(ProceedRentScreen());
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
