import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget CustomTextField() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      'Email'.text.make(),
      TextFormField(
        decoration: const InputDecoration(
          hintText: 'Enter your email',
        ),
      ),
    ],
  );
}
