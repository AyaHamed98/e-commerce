import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/helper/home_helper.dart';
import 'package:flutter_e_commerce/models/productModel.dart';
import 'package:get/get.dart';

import '../models/category_model.dart';

class CategoryController extends GetxController{

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCategory();
    getProduct();
  }

  List categoryList=[];
  List<ProductModel>productList=[];
  List<ProductModel>filteringProductList=[];
  List<CategoryModel> currentCategory=[];
  final GlobalKey<RefreshIndicatorState> refreshKey=GlobalKey<RefreshIndicatorState>();


Future<void>getCategory()async{
  categoryList=[];
  print(categoryList.length);
  HomeHelper().getCategory().then((value){
    for(var i in value){
      categoryList.add(CategoryModel.fromJson(i));
      print("hell world 😁✔👀😃😃✨✨(*/ω＼*)(^///^)💫💘💝💝");
      //home + . => 😎
    }
  });
  print(categoryList.length);
  update();
}

Future<void>getProduct()async{
  productList.clear();
  await HomeHelper().getProducts().then((value) {
    print(value[1].id);
    for(var i in value){
      productList.add(ProductModel.fromJson(i.data()));
      print(value[1].id);

    }
  }
  );
  update();
}
Future<void>getFilttredProdect(String name)async{
  filteringProductList.clear();
  await HomeHelper().filteringProducts(name).then((value) {
    for(var i in value){
      filteringProductList.add(ProductModel.fromJson(i.data()));
    }
  });
  update();
}

}

