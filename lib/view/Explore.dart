import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/const.dart';
import 'package:flutter_e_commerce/controller/explore_controller.dart';
import 'package:flutter_e_commerce/view/category_screen.dart';
import 'package:flutter_e_commerce/view/details_screen.dart';
import 'package:flutter_e_commerce/view/home_screen.dart';
import 'package:flutter_e_commerce/widgets/customText.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../helper/shaesPrefs.dart';

class ExploreScreen extends StatelessWidget {
  final CategoryController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GetBuilder<CategoryController>(
        builder: (_) {
          return Scaffold(
            body: RefreshIndicator(
              key:_controller.refreshKey ,
              onRefresh: () async {
               await  _controller.getCategory();
               await _controller.getProduct();
             //  print(_controller.productList[0].name);
             //    print("gggggggggg");
               // print(",,,,,,,,,,,,,,,,,,,,,,,");
               // print(LocalData().getDataBool(key: "isSignIn"));

              },
              child: ListView(
                children: [
                  SizedBox(
                    height: Get.height * .04,
                  ),
                  _searchTextField(),
                  SizedBox(
                    height: Get.height * .04,
                  ),
                  CustomText(
                    txt: "Category",
                    alignment: AlignmentDirectional.centerStart,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: Get.height * .02,
                  ),
                  _listViewCategories(),
                  SizedBox(
                    height: Get.height * .02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(txt: "Best Selling",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,),
                      CustomText(txt: "See all",
                        fontSize: 18,
                        fontWeight: FontWeight.bold,),
                    ],
                  ),
                  SizedBox(height: Get.height * .05,),
                  _listViewProducts(),

                ],
              ),
            ),
          );
        },
      ),
    );
  }

  SizedBox _listViewProducts() {
    return SizedBox(
      height: Get.height * .41,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _controller.productList.length,
        itemBuilder: (context, index) =>
            GestureDetector(
              onTap: (){
                Get.to(DetailsScreen(model: _controller.productList[index]));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.amber,
                    child: Image.network(
                      _controller.productList[index].image.toString(),
                      height: Get.height * .32,
                      width: Get.width * .46,
                      fit: BoxFit.cover,
                    ),
                  ),
                  CustomText(txt: "${_controller.productList[index].name}"),
                  CustomText(txt: "${_controller.productList[index].brand}",
                    color: Colors.grey,),
                  CustomText(txt: "\$${_controller.productList[index].price}",
                    color: primaryColor,),
                ],
              ),
            ), separatorBuilder: (BuildContext context, int index) =>
          SizedBox(
            width: Get.width * .05,
          ),
      ),
    );
  }

  SizedBox _listViewCategories() {
    return SizedBox(
      height: Get.height * .12,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _controller.categoryList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: ()async{
             // _controller.filteringProductList=[];
              await _controller.getFilttredProdect(_controller.categoryList[index].name);
              Get.to(CategoryScreen(name:_controller.categoryList[index].name,));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey.shade200,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Image.network("${_controller.categoryList[index].image}",
                      width: Get.width * .1,),
                  ),
                ),
                CustomText(
                  txt: _controller.categoryList[index].name, fontSize: 16,),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(width: Get.width * .04,);
        },
      ),
    );
  }

  Container _searchTextField() {
    return Container(
      alignment: AlignmentDirectional.centerStart,
      decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadiusDirectional.circular(24)),
      child: IconButton(
        onPressed: () {},
        icon: Icon(Icons.youtube_searched_for_sharp),
      ),
    );
  }
}

