import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class SingleNotification extends StatelessWidget {
  final String notificationBody;

  SingleNotification({this.notificationBody = "Hello World"});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: context.height * 0.1,
      margin: const EdgeInsets.all(2),
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        elevation: 5,
        color: Color(0xffD9D9D9),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            notificationBody.toString(),
            textAlign: TextAlign.justify,
            style: const TextStyle(
                color: Color(0xff000000),
                fontSize: 16,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
