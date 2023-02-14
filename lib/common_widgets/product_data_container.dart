import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:vaara_app/consts/consts.dart';
import 'package:flutter/material.dart';

import 'circuler_image.dart';

class ProductData extends StatelessWidget {
  bool isLend = true;

  ProductData({isLend = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: .17 * context.height,
      child: Card(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Row(
            children: [
              Container(
                height: context.width * 0.33,
                width: context.width * 0.33 - 15,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image(
                    image: AssetImage("./assets/tent_nature.png"),
                    width: context.width * 0.33,
                    height: context.width * 0.33,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              15.widthBox,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(3),
                          decoration: const BoxDecoration(
                              color: Color.fromARGB(148, 243, 199, 239),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: "Pending".text.size(13).make(),
                        ),
                        Expanded(child: Container()),
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: isLend == false
                                  ? Color.fromARGB(255, 246, 1, 1)
                                  : Color.fromARGB(255, 1, 166, 37),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: "RENT"
                              .text
                              .size(14)
                              .bold
                              .color(Colors.white)
                              .make(),
                        ),
                        5.widthBox,
                      ],
                    ),
                    "Veloce Outrage 601".text.bold.size(19).make(),
                    Row(
                      children: [
                        Icon(Icons.location_on),
                        1.widthBox,
                        "Sylhet".text.size(15).make(),
                        Expanded(child: Container()),
                        "৳ 300 ".text.size(15).color(purple1).make(),
                        "per day".text.size(15).make(),
                        5.widthBox,
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
