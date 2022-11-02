import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_e_commerce/controller/cart_controller.dart';
import 'package:flutter_e_commerce/view/checkOut/addressform_view.dart';
import 'package:flutter_e_commerce/view/checkOut/delivery_view.dart';
import 'package:flutter_e_commerce/view/checkOut/summary_view.dart';
import 'package:flutter_e_commerce/widgets/customText.dart';
import 'package:get/get.dart';

class CheckoutView extends StatelessWidget {
   CheckoutView({Key? key}) : super(key: key);
final CartController controller =Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: PageView(
        controller:controller.pageController ,
        physics: NeverScrollableScrollPhysics(),
        children: [
          DeliveryView(),
          AddressFromView(),
          SummaryView(),
        ],
      ),
    );
  }
}

