import 'package:firebase_auth/firebase_auth.dart';
import 'package:vaara_app/common_widgets/app_logo.dart';
import 'package:vaara_app/common_widgets/search_bar.dart';
import 'package:vaara_app/consts/consts.dart';
import 'package:vaara_app/controllers/product_controller.dart';
import 'package:vaara_app/controllers/user_controller.dart';

import '../common_widgets/product_data_container.dart';
import '../data_classes/product.dart';

class HomeScreen extends StatefulWidget {
  var controller;

  HomeScreen() {
    controller = Get.find<ProductController>();
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser!;

  var swiperlist = [
    'assets/nature_bg.png',
    'assets/cycle_image.png',
    'assets/camera_image.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                appLogoWidget(100, 100),
                SearchBar(),
              ],
            ),
            //5.heightBox,
            VxSwiper.builder(
              autoPlay: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                // setState(() {});
                return Container(
                  padding: EdgeInsets.all(6),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      swiperlist[index],
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                );
              },
              enlargeCenterPage: true,
            ),
            //20.heightBox,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(10, (index) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(129, 191, 182, 190),
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: "Category $index".text.size(13).make(),
                  );
                }),
              ),
            ),
            10.heightBox,
            Expanded(
              //height: 310,
              child: ListView(
                  children: List.generate(widget.controller.productslist.length,
                      (index) {
                // i'll generate
                return ProductData(
                  frequency: widget.controller.productslist[index].frequency,
                  isLend: widget.controller.productslist[index].isLend,
                  location: widget.controller.productslist[index].location,
                  status: widget.controller.productslist[index].status,
                  title: widget.controller.productslist[index].title,
                  imgLocation:
                      widget.controller.productslist[index].imgLocation,
                  price: widget.controller.productslist[index].price,
                  isHome: widget.controller.productslist[index].isHome,
                  productId: widget.controller.productslist[index].id,
                );
              })),
            )
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
        curScene: 1,
        email: user
            .email!, // 1 = home, 2 = my rents, 3 = notifications, 4 = profile
      ),
    );
  }
}
