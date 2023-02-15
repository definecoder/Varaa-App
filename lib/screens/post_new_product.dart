import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:vaara_app/screens/post_new_product_2.dart';
import '../common_widgets/button.dart';

import '../common_widgets/button_next.dart';
import '../common_widgets/custom_textfield.dart';
import '../consts/consts.dart';

class PostNewProduct extends StatefulWidget {
  PostNewProduct() {}

  @override
  State<PostNewProduct> createState() => _PostNewProductState();
}

class _PostNewProductState extends State<PostNewProduct> {
  List<String> options = [
    'Excelent',
    'Good',
    'Okay',
    'Bad',
  ];
  //List<int> tags = [1, 2, 3, 4];
  int tag = 2;

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
                    height: context.height * 0.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextField(
                            title: 'Product Name', hint: 'Add product name'),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                10.widthBox,
                                "Choose product condition"
                                    .text
                                    .bold
                                    .size(18)
                                    .make(),
                              ],
                            ),
                            5.heightBox,
                            ChipsChoice.single(
                              value: tag,
                              onChanged: (val) => setState(() => tag = val),
                              choiceItems: C2Choice.listFrom(
                                source: options,
                                value: (i, v) => i,
                                label: (i, v) => v,
                              ),
                            ),
                          ],
                        ),
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
      ),
    );
  }
}
