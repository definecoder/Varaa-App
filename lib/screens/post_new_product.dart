import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:vaara_app/screens/post_new_product_2.dart';
import '../common_widgets/button.dart';

import '../common_widgets/button_next.dart';
import '../common_widgets/custom_textfield.dart';
import '../consts/consts.dart';

class PostNewProduct extends StatelessWidget {
  PostNewProduct();

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
                  height: context.height * 0.42,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomTextField(
                          title: 'Product Name', hint: 'Add product name'),
                      CustomTextField(
                          title: 'Product Condition',
                          hint: 'Choose product condition'),
                      CustomTextField(
                          title: 'Description',
                          hint: 'Enter product details',
                          isBig: true),
                    ],
                  ).box.rounded.padding(EdgeInsets.all(19)).make(),
                ),
                MyButton(
                    height: 30,
                    width: context.width * 0.36,
                    name: "Upload image"),
                Expanded(child: Container()),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  NextButton(
                      height: 40,
                      width: 95,
                      name: "N E X T",
                      whenPressed: () {
                        Get.to(PostNewProduct2());
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
