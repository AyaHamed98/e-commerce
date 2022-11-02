import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageView extends StatelessWidget {
   ImageView({Key? key,required this.imagePath}) : super(key: key);
   String imagePath;
  @override
  Widget build(BuildContext context) {
    return
     Scaffold(
       appBar: AppBar(
         backgroundColor: Colors.black87,
         leading: IconButton(onPressed: (){
           Get.back();
         }, icon: Icon(Icons.arrow_back_rounded,color: Colors.white,)),
       ),
       backgroundColor: Colors.black87,
       body: Center(
          child: Hero(
              tag: 1,
              child: Image.network(imagePath,fit: BoxFit.cover,width: double.infinity,)),

    ),
     );
  }
}
