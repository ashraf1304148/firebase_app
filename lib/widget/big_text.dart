import 'package:firebase_app/utils/Dimensions.dart';
import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final double size;
  final FontWeight fontWeight;
  final String text;
  final Color color;
  const BigText(
    this.text, {
    Key? key,
    this.size = 70,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
          fontSize: size,
          fontWeight: fontWeight,
          color: color,
        ));
  }
}
