import 'package:firebase_app/utils/Dimensions.dart';
import 'package:flutter/material.dart';

class SignButton extends StatelessWidget {
  final String text;
  const SignButton({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: Dimensions.screenWidth * .7,
        height: Dimensions.height10 * 7,
        // margin: EdgeInsets.only(left: w * .15),
        decoration: BoxDecoration(
            color: Color(0xff576dee),
            borderRadius: BorderRadius.circular(Dimensions.height30)),
        child: Center(
          child: Text(text,
              style: TextStyle(
                fontSize: Dimensions.font20 * 2,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              )),
        ),
      ),
    );
  }
}
