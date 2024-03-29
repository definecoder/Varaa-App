import 'dart:io';

import 'package:chips_choice/chips_choice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vaara_app/common_widgets/image_preview.dart';
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
  final user = FirebaseAuth.instance.currentUser!;

  var nameController = TextEditingController();
  var descriptionController = TextEditingController();

  ImagePicker productImagePicker = ImagePicker();
  bool productImageUploaded = false;
  XFile? productImage;
  List<String> options = [
    'Excellent',
    'Good',
    'Okay',
    'Bad',
  ];
  //List<int> tags = [0, 1, 2, 3];
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
                          title: 'Product Name',
                          hint: 'Add product name',
                          textController: nameController,
                        ),
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
                              onChanged: (val) {
                                setState(() => tag = val);
                              },
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
                            textController: descriptionController,
                            isBig: true),
                      ],
                    ).box.rounded.padding(EdgeInsets.all(19)).make(),
                  ),
                  MyButton(
                    height: 30,
                    width: context.width * 0.36,
                    name: "Upload image",
                    whenPressed: () async {
                      productImage = await productImagePicker.pickImage(
                        source: ImageSource.gallery,
                        imageQuality: fixedImageQuality,
                      );
                      //print("hi");
                      setState(() {
                        if (productImage != null) productImageUploaded = true;
                      });
                    },
                  ),
                  productImageUploaded == true
                      ? ImagePreview(
                          height: 100,
                          width: 100,
                          image: Image.file(File(productImage!.path)))
                      : Container(),
                  productImageUploaded == true
                      ? MyButton(
                          height: 20,
                          width: context.width * 0.33,
                          name: "Cancel Image",
                          whenPressed: () {
                            setState(() {
                              productImageUploaded = false;
                              productImage = null;
                            });
                          })
                      : Expanded(
                          child: Container(),
                        ),
                  //Expanded(child: Container()),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    NextButton(
                        height: 40,
                        width: 95,
                        name: "N E X T",
                        whenPressed: () {
                          if (nameController.text.isEmpty) {
                            context.showToast(
                                msg: "ADD PRODUCT NAME PLEASE",
                                position: VxToastPosition.bottom);
                          } else if (descriptionController.text.isEmpty) {
                            context.showToast(
                                msg: "ADD PRODUCT DESCRIPTION PLEASE",
                                position: VxToastPosition.bottom);
                          } else if (productImage == null) {
                            context.showToast(
                                msg: "ADD PRODUCT PHOTO PLEASE",
                                position: VxToastPosition.bottom);
                          } else
                            Get.to(
                              PostNewProduct2(
                                productName: nameController.text,
                                description: descriptionController.text,
                                imageUrl: (productImage == null)
                                    ? null
                                    : productImage!.path,
                                condition: options[tag],
                              ),
                            );
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
