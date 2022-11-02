import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/controller/cart_controller.dart';
import 'package:flutter_e_commerce/models/cart_product_model.dart';
import 'package:flutter_e_commerce/models/productModel.dart';
import 'package:flutter_e_commerce/view/image.dart';
import 'package:flutter_e_commerce/widgets/customText.dart';
import 'package:flutter_e_commerce/widgets/custom_positioned.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatelessWidget {
   DetailsScreen({Key? key,required this.model}) : super(key: key);
   final ProductModel model;
   final cotroller=Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: Get.height,
            width: Get.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                picture(),
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: SizedBox(
                   height: Get.height*.6,
                   child: SingleChildScrollView(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                     CustomText(txt: model.name,fontSize: 25,fontWeight: FontWeight.bold,),
                     SizedBox(height: Get.height*.03,),
                     Row(
                       children: [
                         customContainer(txt: "Size",widget:  CustomText(txt: model.sized,fontWeight: FontWeight.bold,),),
                         Spacer(),
                         customContainer(txt: "Color",widget:Container(
                           height: Get.height*.04,
                           width: Get.height*.04,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadiusDirectional.circular(10),
                             color: model.color,
                           ),
                         ) ,),
                       ],
                     ),
                       SizedBox(height: Get.height*.03,),
                       CustomText(txt: "Details",fontWeight: FontWeight.bold,fontSize:25 ,),
                       CustomText(txt: model.description,fontSize:18 ,height: 1.5,),
                       SizedBox(height: Get.height*.1,),

                     ],
               ),
                   ),
                 ),
               ),

              ],
            ),
          ),
          CustomPositioned(
              title: "Price",
              price: "\$${model.price}",
              onPressed: (){
                cotroller.addToCart(
                    CartProductModel(
                        name: model.name,
                        image: model.image,
                        price: model.price,
                        count: model.count,
                        uid: model.uid,


                    ));
              }, elevatedBottonTitle: "ADD")
        ],
      ),


    );
  }

  Container customContainer({required String txt,required Widget widget}) {
    return Container(
                 width: Get.width*.4,
                 height: Get.height*.06,
                 decoration: BoxDecoration(
                     borderRadius: BorderRadiusDirectional.circular(20),
                     border: Border.all(color: Colors.grey)
                 ),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: [
                     CustomText(txt: txt,),
                     widget,
                   ],
                 ),
               );
  }

  Stack picture() {
    return Stack(
            children: [
              SizedBox(
                height: Get.height*.35,
                width: Get.width,
                child: GestureDetector(
                    onTap: (){
                      Get.to(ImageView(imagePath: model.image));
                    },
                    child: Hero(
                        tag: 1,
                        child: Image.network(model.image,fit: BoxFit.cover,))),
              ),
              Positioned(
                top: Get.height*.14,
                child: IconButton(onPressed: (){Get.back();}, icon:Icon(Icons.arrow_back_ios_sharp),color: Colors.white,),
              ),
              Positioned(
                right: Get.width*.03,
                top: Get.height*.14,
                child: CircleAvatar(
                   backgroundColor: Colors.white,
                    child: IconButton(onPressed: (){Get.back();}, icon:Icon(Icons.star_outline,color: Colors.black87,),color: Colors.white,)),
              ),
            ],
          );
  }
}
