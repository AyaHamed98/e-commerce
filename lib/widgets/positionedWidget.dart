import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'customElevatedBottom.dart';

class PositinedWidget extends StatelessWidget {
   PositinedWidget({Key? key,required this.txt,required this.firstOnePressed,required this.secondPressed}) : super(key: key);
   void Function() firstOnePressed;
   void Function() secondPressed;
   String txt;
  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        child:Container(
          color: Colors.white,
          width: Get.width,
          height: Get.height*.14,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButton(onPressed: firstOnePressed
              , elevatedBottonTitle: "BACK",primary: Colors.white,txtColor: Colors.black87,),
              CustomButton(onPressed:secondPressed

              , elevatedBottonTitle: txt),

            ],
          ),
        )
    );
  }
}
