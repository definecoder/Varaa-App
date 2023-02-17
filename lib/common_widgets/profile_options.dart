import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

//  Color(0xff4D73FA)

class Profile_option extends StatelessWidget {
  final String bodyText;
  final IconData? usedIcon;
  Function onTapped;

  Profile_option(
      {required this.bodyText, required this.usedIcon, required this.onTapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapped();
      },
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            20.widthBox,
            Icon(
              usedIcon,
              color: Color(0xff9F1F63),
              size: 30,
            ),
            15.widthBox,
            bodyText.text
                .fontFamily('popins')
                .size(16)
                .fontWeight(FontWeight.w500)
                .wider
                .make(),
            Expanded(
              child: Container(
                //width: ,
                //color: Colors.amber,
                alignment: Alignment.centerRight,
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xff9F1F63),
                  size: 25,
                ),
              ),
            ),
            15.widthBox,
          ],
        ),
      ),
    );
  }
}
