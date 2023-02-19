import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:vaara_app/consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:vaara_app/screens/product_info_screen.dart';

import 'circuler_image.dart';

class ProductData extends StatelessWidget {
  final bool isLend;
  final String title;
  final String location;
  final String frequency;
  final String status;
  final String imgLocation;
  final String price;
  final bool isHome;

  ProductData(
      {required this.isLend,
      required this.frequency,
      required this.location,
      required this.status,
      required this.title,
      required this.imgLocation,
      required this.price,
      this.isHome = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(ProductInfoScreen());
      },
      child: Container(
        width: double.infinity,
        height: .18 * context.height,
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
                      image: AssetImage(imgLocation),
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
                            padding: EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(147, 232, 209, 230),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            child: status.text.size(13).make(),
                          ),
                          Expanded(child: Container()),
                          isHome == false
                              ? Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: isLend == true
                                          ? Color.fromARGB(255, 246, 1, 1)
                                          : Color.fromARGB(255, 1, 166, 37),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                  child: (isLend == true ? "LEND" : "RENT")
                                      .text
                                      .size(14)
                                      .bold
                                      .color(Colors.white)
                                      .make(),
                                )
                              : Container(),
                          5.widthBox,
                        ],
                      ),
                      title.text.fontWeight(FontWeight.w500).size(16).make(),
                      Row(
                        children: [
                          Icon(Icons.location_on, size: 17),
                          1.widthBox,
                          location.text.size(14).make(),
                          Expanded(child: Container()),
                          ("৳ " + price + " ")
                              .text
                              .size(14)
                              .color(purple1)
                              .make(),
                          (frequency).text.size(14).make(),
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
      ),
    );
  }
}
