import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:vaara_app/common_widgets/app_logo.dart';
import 'package:vaara_app/common_widgets/bg_widget.dart';
import 'package:get/get.dart';
import 'package:vaara_app/common_widgets/custom_textfield.dart';
import 'package:velocity_x/velocity_x.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  final String p = 'Poppins';

  @override
  Widget build(BuildContext context) {
    return BgWidget(
        child: Material(
      child: SafeArea(
        // appBar: AppBar(title: Text('Hi')),
        child: Center(
          child: Column(children: [
            20.heightBox,
            appLogoWidget(150, 150),
            10.heightBox,
            "Create Account".text.fontFamily(p).size(30).bold.make(),
            70.heightBox,
            Column(
              children: [
                CustomTextField(),
              ],
            ).box.rounded.padding(EdgeInsets.all(19)).make(),
          ]),
        ),
      ),
    ));
  }
}
