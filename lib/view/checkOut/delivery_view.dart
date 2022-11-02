import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_e_commerce/const.dart';
import 'package:flutter_e_commerce/controller/cart_controller.dart';
import 'package:flutter_e_commerce/widgets/customElevatedBottom.dart';
import 'package:flutter_e_commerce/widgets/customText.dart';
import 'package:flutter_e_commerce/widgets/custom_appBar.dart';
import 'package:flutter_e_commerce/widgets/custom_positioned.dart';
import 'package:get/get.dart';


class DeliveryView extends StatelessWidget {
  DeliveryView({Key? key}) : super(key: key);
  final CartController controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Stack(
        children: [
          Column(
            children: [
              CustomBar(txt: "Checkout"),
              SizedBox(
                height: Get.height * .06,
              ),
              customListTile(
                radioValue: "Standard",
                title: "title",
                subTitle: "Order wii be delivered between 3-5 business day",
              ),
              SizedBox(
                height: Get.height * .05,
              ),
              customListTile(
                radioValue: "Next",
                title: "Next Day Dllivery",
                subTitle: "Please your before 6pm and your items will be delivered the nex day ",
              ),
              SizedBox(
                height: Get.height * .05,
              ),
              customListTile(
                radioValue: "Nominated ",
                title: "Nominated Delivery",
                subTitle: "Pick a particular data from the calender and order will delivered on selected data",
              ),
            ],
          ),
          CustomPositioned(
              title: "",
              price: "",
                onPressed: ()=>controller.pageController?.nextPage(duration: Duration(milliseconds: 500), curve: Curves.linear),
              elevatedBottonTitle: "NEXT",
          ),
        ],
      ),
    );
  }

  GetBuilder<CartController> customListTile({
    required String radioValue,
    required String title,
    required String subTitle,
  }) {
    return GetBuilder<CartController>(
      builder: (_) {
        return ListTile(
          title: CustomText(
            txt: title,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
          subtitle: Padding(
            padding: EdgeInsets.only(top: Get.height * .021),
            child: CustomText(txt: subTitle,),
          ),
          trailing: Padding(
            padding: EdgeInsets.only(top: Get.height * .06),
            child: Radio(
              activeColor: primaryColor,
              value: radioValue,
              groupValue: controller.subTitle,
              onChanged: (value) {
                controller.changeValue(value);
              },
            ),
          ),

        );
      },
    );
  }
}

