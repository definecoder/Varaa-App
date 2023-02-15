import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:vaara_app/common_widgets/app_logo.dart';
import 'package:vaara_app/common_widgets/button.dart';
import 'package:vaara_app/common_widgets/circuler_image.dart';
import 'package:vaara_app/consts/consts.dart';

class ProceedRentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Center(
                  child:
                      appLogoWidget(context.width * 0.4, context.width * 0.4),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: purple1,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
            5.heightBox,
            Center(
              child: "Rent request successful"
                  .text
                  .size(24)
                  .color(Color.fromARGB(197, 43, 42, 42))
                  .bold
                  .make(),
            ),
            Row(
              children: [
                Column(
                  children: [
                    CirculerImage("./assets/dp1.png", context.width * 0.12),
                    Container(
                      padding: EdgeInsets.all(7),
                      child: MyButton(height: 20, width: 60, name: "PRO"),
                    ),
                  ],
                ),
                Expanded(child: Container()),
                Column(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
