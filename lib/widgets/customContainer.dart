import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'customText.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({required this.txt,required this.imagePath,Key? key}) : super(key: key);
 final String imagePath;
 final String txt;
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){},
      child: Container(
        height: Get.height*.07,
        width: Get.width,
        decoration: BoxDecoration(
          border: Border.all(color:Colors.grey),
          borderRadius:BorderRadiusDirectional.circular(10),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(imagePath,width: Get.width*.08,),
            CustomText(txt: txt,fontSize: 18,)
          ],
        ),
      ),
    );
  }
}
