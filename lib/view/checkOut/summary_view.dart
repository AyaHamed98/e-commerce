import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/const.dart';
import 'package:flutter_e_commerce/controller/cart_controller.dart';
import 'package:flutter_e_commerce/widgets/customText.dart';
import 'package:flutter_e_commerce/widgets/custom_appBar.dart';
import 'package:flutter_e_commerce/widgets/positionedWidget.dart';
import 'package:get/get.dart';

class SummaryView extends StatelessWidget {
   SummaryView({Key? key}) : super(key: key);
   final CartController controller=Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomBar(txt: "Summary"),
              SizedBox(
                height: Get.height*.3,
                child: controller.cartList.isEmpty?Center(child: CustomText(txt: "Cart is empty")):ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.cartList.length,
                    itemBuilder:carItems, separatorBuilder: (BuildContext context, int index)=>
                  SizedBox(width: Get.width*.04,),
                ),
              ),
              Divider(height: Get.height*.05,),
              CustomText(
                  txt: "Shipping Adress",
                 fontSize: 22,
                 fontWeight: FontWeight.bold,
              ),
              CustomText(
                  txt: "${controller.streetCont!.text},${controller.cityCont!.text},${controller.stateCont!.text},${controller.countrytCont!.text}",
                 //fontSize: 16,
              ),
              TextButton(onPressed: (){
                controller.pageController!.previousPage(duration: Duration(milliseconds: 500), curve: Curves.linear);
              }, child:CustomText(txt:"Change",color: primaryColor,)),

              Divider(height: Get.height*.05,),



            ],
          ),
          PositinedWidget(
              txt: "Deliver",
              firstOnePressed: ()=>controller.pageController!.previousPage(duration: Duration(milliseconds: 500), curve: Curves.linear),
              secondPressed: (){
               controller.sendOrder();
              },
          )
        ],
      ),
    );
  }

  Widget carItems(context,index){
            return
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Image.network(
                         controller.cartList[index].image,
                         width: Get.width*.32,
                         height: Get.width*.32,
                       fit: BoxFit.cover
                     ),
                     CustomText(txt: controller.cartList[index].name),
                     CustomText(txt: "\$${controller.cartList[index].price},",color: primaryColor,fontWeight: FontWeight.bold,),
                   ],
                );
            }
}