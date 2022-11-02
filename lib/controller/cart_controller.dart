import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_e_commerce/helper/database_helper/cart_database_helper.dart';
import 'package:flutter_e_commerce/helper/oreder_helper.dart';
import 'package:flutter_e_commerce/models/cart_product_model.dart';
import 'package:flutter_e_commerce/models/order_model.dart';
import 'package:get/get.dart';

import 'explore_controller.dart';

class CartController extends GetxController{
  DatabaseHelper? db;
  List<CartProductModel>cartList=[];
  List orderList=[];
   double? total;
  PageController? pageController;
  String subTitle="Standard";
  TextEditingController?streetCont;
  TextEditingController?cityCont;
  TextEditingController?stateCont;
  TextEditingController?countrytCont;
  final GlobalKey<FormState>formKey=GlobalKey<FormState>();
  @override
  void onInit() {
    getOrder();
    pageController=PageController();
    streetCont=TextEditingController();
    cityCont=TextEditingController();
    stateCont=TextEditingController();
    countrytCont=TextEditingController();
    // TODO: implement onInit
    super.onInit();
    db=DatabaseHelper();
    db!.createDatabase();
    getAllProducts();
  }
  // add elemet 
  // we have to rebuild cartlist(get all product ) when we niset to database
  Future<void>addToCart(CartProductModel model)async{
    db!.getAllProduct().then((value)async{
      if(value.isNotEmpty){
        for(var i in value){
          if(i["uid"]==model.uid){
            return;
          }
        }
      }
      await db!.createProduct(model);
      getAllProducts();
      getOrder();
    }
    );
    update();
  }
  //get all element from database
  //calculate when recreate list when delete or insert
  Future<void>getAllProducts()async{
    cartList=[];
    await db!.getAllProduct().then((value){
      for(var i in value){
        cartList.add(CartProductModel.fromJson(i));
      }
    });
    calcTotal();
    update();
  }

  
  //when we delete element we have to recreate cart list so we should calling getAllProducts meth
  deleteProduct(int id)async{
   await db!.delete(id);
   getAllProducts();
   update();
  }
  
  //// calculate total
Future<void>calcTotal()async{
    total=0.0;
    for(var i in cartList){
      double count= i.count.toDouble();
      double price= i.price;
      total=total!+count*price;

    }
    update();
}

Future<void>increaseCount(int index)async{
    cartList[index].count++;
    await db!.update(cartList[index]);
    print( cartList[index].count);
    calcTotal();
    update();
}

  Future<void>decreaseCount(int index)async{
    if(cartList[index].count!=1){
      cartList[index].count--;
    }
    await db!.update(cartList[index]);
    calcTotal();
    update();
  }

  void changeValue(value){
    subTitle=value.toString();
    update();
  }
  Future<void>clearCart()async{
    db!.cleanTable();
  }
  Future<void>sendOrder()async{
    await OrderHelper().setOrder(OrderModel(
        deliveryType: 'yy',
      adrees: "${streetCont!.text},${cityCont!.text},${stateCont!.text},${countrytCont!.text}",
      products: cartList,
      userId: FirebaseAuth.instance.currentUser!.uid,
      isDeleverd: false,
    )).then((value) {
      clearCart();
      getAllProducts();
      Get.back();
    });
  }
Future<void> getOrder()async{
     await OrderHelper().getOrder().then((value) {
      for(var i in value){
        orderList.add(OrderModel.fromJson(i));
      }
      print("gggggggggg");
      print(orderList.length);
    });
     update();
 }


}