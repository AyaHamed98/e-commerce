import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {required this.txt,
      this.color,
      this.fontWeight,
      this.fontSize=19,
      this.alignment,
        this.height,
      Key? key})
      : super(key: key);
  final AlignmentGeometry? alignment;
  final String txt;
  final double fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final double?height;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        txt,
        style:
            TextStyle(fontSize: fontSize, fontWeight: fontWeight, color: color,height:height ),
      ),
    );
  }
}
