
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_e_commerce/const.dart';
import 'package:flutter_e_commerce/controller/explore_controller.dart';
import 'package:flutter_e_commerce/widgets/customText.dart';
import 'package:flutter_e_commerce/widgets/custom_appBar.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
   CategoryScreen({Key? key,required this.name}) : super(key: key);
   final CategoryController _controller=Get.find();
    final String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          CustomBar(txt:name ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
             height: Get.height*.7,
              child: GridView.builder(
                  itemCount: _controller.filteringProductList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: .6,
                     crossAxisSpacing: 16,
                    mainAxisSpacing: .2,
                  ),
                  itemBuilder: (context,index){
                    return gridViewItems(
                      index: index
                    );
                  },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget gridViewItems({required int index}) {
    return
       Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.network(_controller.filteringProductList[index].image,
            height: Get.height*.257,fit: BoxFit.cover,),
          CustomText(txt: _controller.filteringProductList[index].name,fontWeight: FontWeight.bold,),
          CustomText(txt: _controller.filteringProductList[index].brand,color: Colors.grey,),
          CustomText(txt: "\$${_controller.filteringProductList[index].price}",fontWeight: FontWeight.bold,color:primaryColor ,),
        ],

    );
  }
}
