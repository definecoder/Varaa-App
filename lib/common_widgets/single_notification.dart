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
      margin: const EdgeInsets.all(5),
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        elevation: 5,
        color: Colors.white,
        child: Text(
          notificationBody.toString(),
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Color(0xff000000),
              fontSize: 14,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
