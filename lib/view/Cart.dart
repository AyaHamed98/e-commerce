import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/const.dart';
import 'package:flutter_e_commerce/controller/cart_controller.dart';
import 'package:flutter_e_commerce/view/checkOut/checkout_view.dart';
import 'package:flutter_e_commerce/widgets/customText.dart';
import 'package:flutter_e_commerce/widgets/custom_positioned.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
  final controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: GetBuilder<CartController>(
        builder: (_) {
          return Stack(
            children: [
              cartListView(),
              CustomPositioned(
                title: "TOTAL",
                price: "\$${(controller.total)!.toStringAsFixed(2)}",
                onPressed: () {
                  Get.to(CheckoutView());
                },
                elevatedBottonTitle: "Checkout",
              )
            ],
          );
        },
      ),
    );
  }




  SizedBox cartListView() {
    return SizedBox(
        height: Get.height,
        child:controller.cartList.isEmpty?Center(
          child: Text("Cart is empty"),
        ): ListView.builder(
            itemCount: controller.cartList.length + 1,
            itemBuilder: (context, i) {
              if (i == controller.cartList.length) {
                return SizedBox(
                  height: Get.height * .1,
                );
              }
              return cartProductsWidget(i, context);
            }
        ));
  }


  SizedBox cartProductsWidget(int i, BuildContext context) {
    return SizedBox(
        width: Get.width,
        height: Get.height * .2,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Dismissible(
            key: UniqueKey(),
            secondaryBackground: secondaryBackGrounfWidget(),
            background: dismissableBackgroundWidget(),
            child: dismisableItem(i),
            onDismissed: (DismissDirection direction) async {
              if (direction == DismissDirection.endToStart) {
                await controller.deleteProduct(controller.cartList[i].id!);
              }
            },
            confirmDismiss: (DismissDirection direction) async {
              return await confirmDismissShowDialog(context, direction);
            },
          ),
        )
    );
  }

  Future<bool?> confirmDismissShowDialog(BuildContext context, DismissDirection direction) {
    return showDialog(
                context: context,
                builder: (context) =>
                    AlertDialog(
                      title: CustomText(txt: direction==DismissDirection.endToStart?"Delete Confirmation":"Favorite Confirmation",),
                      content: CustomText(txt: direction==DismissDirection.endToStart?"Are you sure you want to delete this item":"Are you sure ",),
                      actions: [
                        TextButton(onPressed: () {
                          Navigator.of(context).pop(true);
                        }, child: CustomText(txt: direction==DismissDirection.endToStart?"Delete":"Yes",)),
                        TextButton(onPressed: () {
                          Navigator.of(context).pop(false);
                        }, child: CustomText(txt: "cancel",)),
                      ],
                    ),
            );
  }

  Row dismisableItem(int i) {
    return Row(
            children: [
              SizedBox(
                height: Get.height * .2,
                width: Get.height * .18,
                child: Image.network(
                  controller.cartList[i].image,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: Get.width * .06,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(txt: controller.cartList[i].name,
                    fontWeight: FontWeight.bold,),
                  CustomText(
                    txt: "\$${controller.cartList[i].price}",
                    color: primaryColor,
                    fontWeight: FontWeight.bold,),
                  SizedBox(height: Get.height * .02,),
                  Container(
                    height: Get.height * .05,
                    width: Get.width * .34,
                    color: Colors.grey.shade300,
                    child: Row(
                      children: [
                        IconButton(onPressed: () {
                          controller.decreaseCount(i);
                        }, icon: Icon(Icons.remove)),
                        GetBuilder<CartController>(
                          builder: (_) {
                            return CustomText(
                                txt: controller.cartList[i]
                                    .count.toString());
                          },
                        ),
                        IconButton(onPressed: () {
                          controller.increaseCount(i);
                        }, icon: Icon(Icons.add)),
                      ],
                    ),
                  )
                ],
              )
            ],
          );
  }

  Container dismissableBackgroundWidget() {
    return Container(
            color: Colors.yellow,
            child: Icon(Icons.favorite, color: Colors.white,),
            alignment: AlignmentDirectional.centerStart,
          );
  }

  Container secondaryBackGrounfWidget() {
    return Container(
            color: Colors.red,
            child: Icon(Icons.delete, color: Colors.white,),
            alignment: AlignmentDirectional.centerEnd,
          );
  }
}
