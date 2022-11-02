import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'customText.dart';

class CustomBar extends StatelessWidget {
  const CustomBar({Key? key,required this.txt}) : super(key: key);
  final String txt;
  @override
  Widget build(BuildContext context) {
    return    Row(
      children: [
        IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(
          Icons.arrow_back_ios_sharp,
          color: Colors.black87,
        )),
        SizedBox(width: Get.width*.29,),
        CustomText(txt: txt,fontSize: 22,),
      ],
    );
  }
}
