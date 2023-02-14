import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:vaara_app/common_widgets/product_data_container.dart';
import 'package:vaara_app/consts/consts.dart';
import '../consts/colors.dart';

import '../common_widgets/BottomBar.dart';

class MyLendsRents extends StatelessWidget {
  const MyLendsRents({super.key});

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
            ProductData(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        elevation: 5,
        backgroundColor: Color(0xff9F1F63),
        child: Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(
        curScene: 2, // 1 = home, 2 = my rents, 3 = notifications, 4 = profile
      ),
    );
  }
}
