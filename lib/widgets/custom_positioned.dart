import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../const.dart';
import 'customElevatedBottom.dart';
import 'customText.dart';

class CustomPositioned extends StatelessWidget {
   CustomPositioned({Key? key,required this.title,required this.price,required this.onPressed,required this.elevatedBottonTitle}) : super(key: key);
  final String title;
  final String price;
  final void Function() onPressed;
  final String elevatedBottonTitle;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        width: Get.width,
        height: Get.height*.1,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(txt:title ,color: Colors.grey,fontSize: 17,),
                  CustomText(txt: price,color:primaryColor,fontSize: 20,fontWeight: FontWeight.bold,),
                ],
              ),
              CustomButton(onPressed: onPressed, elevatedBottonTitle: elevatedBottonTitle),
            ],
          ),
        ),
      ),

    );
  }
}


