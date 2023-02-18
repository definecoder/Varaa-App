import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:vaara_app/common_widgets/product_data_container.dart';
import 'package:vaara_app/consts/consts.dart';
import 'package:vaara_app/screens/post_new_product.dart';
import '../consts/colors.dart';

import '../common_widgets/BottomBar.dart';

class MyLendsRents extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            20.heightBox,
            Row(
              children: [
                30.widthBox,
                "My Lends and Rents".text.size(22).bold.color(purple1).make(),
              ],
            ),
            20.heightBox,
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // I have to make this list dynamic, i need to use generate method of list
                    ProductData(
                      frequency: "month",
                      isLend: true,
                      location: "Chattogram",
                      status: "Pending",
                      title: "CANON 700D",
                      imgLocation: "./assets/camera_image.png",
                      price: 700.toString(),
                    ),
                    ProductData(
                      frequency: "week",
                      isLend: false,
                      location: "Sylhet",
                      status: "Occupied",
                      title: "Veloce Outrage 601",
                      imgLocation: "./assets/cycle_image.png",
                      price: 300.toString(),
                    ),
                    ProductData(
                      frequency: "day",
                      isLend: false,
                      location: "Mymensingh",
                      status: "Request pending",
                      title: "Flutter Appertice Book original print",
                      imgLocation: "./assets/book_image_1.png",
                      price: 25.toString(),
                    ),
                    ProductData(
                      frequency: "year",
                      isLend: true,
                      location: "Cox-Bazar",
                      status: "Delivaring",
                      title: "Camping tent for 4 person for 4 person",
                      imgLocation: "./assets/tent_nature.png",
                      price: 3000.toString(),
                    ),
                    ProductData(
                      frequency: "year",
                      isLend: true,
                      location: "Cox-Bazar",
                      status: "Delivaring",
                      title: "Camping tent for 4 person",
                      imgLocation: "./assets/tent_nature.png",
                      price: 3000.toString(),
                    ),
                    ProductData(
                      frequency: "year",
                      isLend: true,
                      location: "Cox-Bazar",
                      status: "Delivaring",
                      title: "Camping tent for 4 person",
                      imgLocation: "./assets/tent_nature.png",
                      price: 3000.toString(),
                    ),
                    ProductData(
                      frequency: "year",
                      isLend: true,
                      location: "Cox-Bazar",
                      status: "Delivaring",
                      title: "Camping tent for 4 person",
                      imgLocation: "./assets/tent_nature.png",
                      price: 3000.toString(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(PostNewProduct());
        },
        elevation: 5,
        backgroundColor: Color(0xff9F1F63),
        child: Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(
        curScene: 2,
        email: user
            .email!, // 1 = home, 2 = my rents, 3 = notifications, 4 = profile
      ),
    );
  }
}
