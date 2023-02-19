import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:vaara_app/common_widgets/BottomBar.dart';
import 'package:vaara_app/common_widgets/app_logo.dart';
import 'package:vaara_app/common_widgets/circuler_image.dart';
import 'package:vaara_app/screens/my_lends_rents.dart';
import 'package:vaara_app/screens/notifications_screen.dart';
import 'package:vaara_app/screens/post_new_product.dart';
import 'package:velocity_x/velocity_x.dart';
import '../common_widgets/button.dart';
import '../common_widgets/button2.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/cupertino.dart';

import '../common_widgets/profile_options.dart';
import '../controllers/user_controller.dart';
import '../data_classes/product.dart';
import '../firebase_classes/login_auth.dart';

class ProfileScreen extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;
  var userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: SizedBox(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  15.heightBox,
                  Row(
                    children: [
                      30.widthBox,
                      /*CupertinoNavigationBarBackButton(
                        color: Color(0xff9F1F63),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),*/
                      /*Transform.scale(
                        scale: 1.5,
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back_rounded,
                          ),
                          color: Color(0xff9F1F63),
                          onPressed: () {},
                        ),
                      ),*/
                      // 10.widthBox,
                      "My Profile"
                          .text
                          .fontFamily('popins')
                          .size(22)
                          .color(Color(0xff9F1F63))
                          .fontWeight(FontWeight.bold)
                          .make(),
                    ],
                  ),
                  30.heightBox,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      40.widthBox,
                      CirculerImage(userController.currentUser!.imageUrl,
                          0.17 * context.width),
                      30.widthBox,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          userController.currentUser!.username.text
                              .fontFamily('popins')
                              .size(22)
                              .color(Colors.black)
                              .fontWeight(FontWeight.bold)
                              .make(),
                          10.heightBox,
                          "Account Security Level 3"
                              .text
                              .fontFamily('popins')
                              .size(14)
                              .color(Colors.black)
                              .make(),
                        ],
                      ),
                    ],
                  ),
                  10.heightBox,
                  Divider(
                    color: Colors.grey.shade400,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xff335EF7),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(10),
                    width: context.width * .8,
                    height: context.height * .12,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //20.widthBox,
                          const Icon(
                            Icons.star,
                            color: Color(0xffF2C94C),
                            size: 55,
                          ),
                          5.widthBox,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              "Upgrade to Premium"
                                  .text
                                  .fontFamily('popins')
                                  .size(20)
                                  .color(Colors.white)
                                  .fontWeight(FontWeight.bold)
                                  .make(),
                              10.heightBox,
                              "Enjoy full Access of Varaa App"
                                  .text
                                  .fontFamily('popins')
                                  .size(14)
                                  .color(Colors.white)
                                  .make(),
                            ],
                          )
                        ]),
                  ),
                  20.heightBox,
                  Profile_option(
                    bodyText: "Edit Profile",
                    usedIcon: Icons.person_rounded,
                    onTapped: () {},
                  ),
                  10.heightBox,
                  Profile_option(
                    bodyText: "Notification",
                    usedIcon: Icons.notifications,
                    onTapped: () {
                      Get.to(NotificationScreen());
                    },
                  ),
                  10.heightBox,
                  Profile_option(
                    bodyText: "My Rents and Lends",
                    usedIcon: Icons.access_alarm_sharp,
                    onTapped: () async {
                      List<Product> userProducts = [];

                      CollectionReference collectionRef =
                          FirebaseFirestore.instance.collection('products');
                      QuerySnapshot querySnapshot = await collectionRef.get();

                      for (QueryDocumentSnapshot documentSnapshot
                          in querySnapshot.docs) {
                        // access the document fields using documentSnapshot.data()
                        // print(documentSnapshot['uid']);
                        // print('1');

                        if (documentSnapshot['uid'] == user.uid) {
                          userProducts.add(
                            Product(
                                location: documentSnapshot['city'],
                                title: documentSnapshot['title'],
                                frequency: documentSnapshot['frequency'],
                                price: documentSnapshot['rent'],
                                address: documentSnapshot['address'],
                                condition: documentSnapshot['condition'],
                                description: documentSnapshot['description'],
                                imgLocation: documentSnapshot['imageUrl'],
                                isLend: documentSnapshot['isLend'],
                                status: documentSnapshot['status'],
                                isHome: false,
                                id: documentSnapshot['id'],
                                productOwner: documentSnapshot['uid']),
                          );
                        }

                        // userProducts.add(Product(location: 'location', title: 'title', frequency: 'frequency', price: 'price'));
                      }

                      Get.to(MyLendsRents(userProducts));
                    },
                  ),
                  10.heightBox,
                  Profile_option(
                    bodyText: "Privacy Policy",
                    usedIcon: Icons.lock_person_sharp,
                    onTapped: () {},
                  ),
                  10.heightBox,
                  Profile_option(
                    bodyText: "Help Center",
                    usedIcon: Icons.help_center,
                    onTapped: () {},
                  ),
                  10.heightBox,
                  Profile_option(
                    bodyText: "Logout",
                    usedIcon: Icons.exit_to_app,
                    onTapped: () {
                      FirebaseAuth.instance.signOut();
                      Get.to(LoginAuth());
                      //print("hi");
                    },
                  ),
                  10.heightBox,
                ],
              ),
            ),
          ),
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
        email: user.email!,
        curScene: 4,
      ),
    );
  }
}
