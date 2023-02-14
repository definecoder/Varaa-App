import 'package:vaara_app/common_widgets/app_logo.dart';
import 'package:vaara_app/common_widgets/bg_widget.dart';
import 'package:vaara_app/common_widgets/custom_textfield.dart';
import 'package:vaara_app/consts/consts.dart';

import '../common_widgets/button.dart';

class FinishSignup extends StatefulWidget {
  const FinishSignup({super.key});

  @override
  State<FinishSignup> createState() => _FinishSignupState();
}

class _FinishSignupState extends State<FinishSignup> {
  @override
  Widget build(BuildContext context) {
    return BgWidget(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(color: purple1),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                appLogoWidget(150, 150),
                10.heightBox,
                "Finish Sign up".text.fontFamily(poppins).size(30).bold.make(),
                20.heightBox,
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add_a_photo),
                  color: purple1,
                )
                    .box
                    .roundedFull
                    .size(100, 100)
                    .border(color: purple1, width: 2)
                    .make(),
                10.heightBox,
                "Upload Image".text.fontFamily(poppins).make(),
                Column(
                  children: [
                    CustomTextField(
                        title: 'Username', hint: 'Choose your username'),
                    CustomTextField(
                        title: 'Phone Number', hint: 'Enter your phone number'),
                  ],
                ).box.rounded.padding(EdgeInsets.all(19)).make(),
                40.heightBox,
                MyButton(
                  name: 'Finish Sign up',
                  width: context.width - 70,
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
