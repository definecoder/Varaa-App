import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vaara_app/common_widgets/button.dart';
import 'package:vaara_app/consts/consts.dart';

class ImagePreview extends StatelessWidget {
  double height, width;
  Image image;

  ImagePreview(
      {required this.height, required this.width, required this.image});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(20),
        alignment: Alignment.center,
        height: context.height * 0.15,
        //width: context.width * 0.33,
        child: ClipRRect(
          child: image,
        ),
      ),
    );
  }
}
