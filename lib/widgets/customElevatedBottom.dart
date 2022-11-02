import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/const.dart';
import 'package:flutter_e_commerce/widgets/customText.dart';
import 'package:get/get.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({this.alignment,required this.onpressed, Key? key,required this.txt}) : super(key: key);
  final void Function() onpressed;
  final String txt;
  final AlignmentGeometry? alignment;
  @override
  Widget build(BuildContext context) {
    return     ElevatedButton(
      onPressed: onpressed,
      child: CustomText(
        txt: txt,
        color: Colors.white,
        alignment: alignment,
      ),
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 10)),

    );
  }
}
class CustomButton extends StatelessWidget {
   CustomButton({
    Key? key,
    required this.onPressed,
    required this.elevatedBottonTitle,
    this.txtColor=Colors.white,
    this.primary
  }) : super(key: key);

  final void Function()? onPressed;
  final String elevatedBottonTitle;
   Color? txtColor;
  Color? primary;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height*.07,
      width: Get.width*.4,
      child: ElevatedButton(
        onPressed:onPressed,
        child:CustomText(txt: elevatedBottonTitle,color: txtColor,fontSize: 20,),
        style: ElevatedButton.styleFrom(
          primary: primary,
          side: BorderSide(color: primaryColor),
        ),
      ),
    );
  }
}