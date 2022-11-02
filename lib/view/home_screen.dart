import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/const.dart';
import 'package:flutter_e_commerce/controller/explore_controller.dart';
import 'package:flutter_e_commerce/view/Explore.dart';
import 'package:flutter_e_commerce/view/account_view.dart';
import 'package:flutter_e_commerce/view/Cart.dart';
import 'package:flutter_e_commerce/widgets/customText.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 //final _controller=Get.put(CategoryController());
   List<Widget>_screens=[
     ExploreScreen(),
     CartScreen(),
     AccountViewScreen(),
   ];
   int _currentIndex=0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:_screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
         currentIndex: _currentIndex,
          onTap: (index){
            setState(() {
              _currentIndex=index;
            });
            print(index);
            print(_currentIndex);
          },
           showSelectedLabels: false,
            showUnselectedLabels: false,

            items:[
              BottomNavigationBarItem(
                  icon: Icon(Icons.arrow_back_ios,color: primaryColor,),
                  activeIcon:CustomText(txt: "Explore",fontSize: 17,fontWeight: FontWeight.bold,),
                  label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_shopping_cart_outlined,color: primaryColor,),
                activeIcon: CustomText(txt: "Card",fontSize: 17,fontWeight: FontWeight.bold,),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.perm_identity_outlined,color: primaryColor,),
                activeIcon: CustomText(txt: "User",fontSize: 17,fontWeight: FontWeight.bold,),
                label: "mm",
              ),
            ]
        ),
      ),
    ) ;
  }
}
