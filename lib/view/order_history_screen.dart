import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/controller/cart_controller.dart';
import 'package:flutter_e_commerce/widgets/customText.dart';
import 'package:flutter_e_commerce/widgets/custom_appBar.dart';
import 'package:get/get.dart';

class OrderHistoryScreen extends StatelessWidget {
   OrderHistoryScreen({Key? key}) : super(key: key){
     print(">>>>>>>>>>>>>>>>>>>>>>>........");
     print(controller.orderList.length);

   }
   final controller=Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          CustomBar(txt: "Track Orders"),
          SizedBox(
            height: Get.height*.8,
            child: ListView.builder(
              itemCount:controller.orderList.length ,
              itemBuilder:(context,index)=> Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade100,
                            blurRadius: 2,
                            spreadRadius: 1
                        )
                      ]
                  ),
                  width: Get.width,
                  height: Get.height*.2,
                  margin: const EdgeInsetsDirectional.all(25),
                  child:Row(
                    children: [
                      Column(
                        children: [
                          CustomText(txt: controller.orderList[index].adrees),
                          CustomText(txt: controller.orderList[index].products[index].price.toString(),),
                          Container(
                            height: Get.height*.1,
                            width: Get.height*.1,
                            color: controller.orderList[index].isDeleverd?Colors.green:Colors.yellow,
                            child:controller.orderList[index].isDeleverd?CustomText(txt:"Done"):CustomText(txt: "in Transit"),
                          )
                        ],
                      ),
                      SizedBox(
                          height: 100,
                          width: 100,
                          child: Image.network(controller.orderList[0].products[0].image),
                      )
                    ],
                  )
              ),
            ),
          )

        ],
      ),
    );
  }
}
