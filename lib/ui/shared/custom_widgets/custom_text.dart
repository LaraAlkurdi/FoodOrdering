import 'package:flutter/material.dart';
import 'package:food_1/ui/shared/utils.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
      required this.text,
      required this.textColor,
      this.fontWeight, required this.textsize,});
  final String text;
  final Color textColor;
  final double textsize;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(text,
         textAlign: TextAlign.center,
        style: TextStyle(
          fontSize:textsize,
          fontWeight:  fontWeight??FontWeight.bold,
          color:textColor, //عامل main black color
        ));
  }
}
