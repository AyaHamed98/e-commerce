
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/const.dart';
import 'package:flutter_e_commerce/controller/user_controller.dart';
import 'package:flutter_e_commerce/view/order_history_screen.dart';
import 'package:flutter_e_commerce/widgets/customText.dart';
import 'package:get/get.dart';
class AccountViewScreen extends StatelessWidget {
   AccountViewScreen({Key? key}) : super(key: key);
   final controller=Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.greenAccent,
                  radius: 50,
                  backgroundImage:AssetImage("asset/images/pic.png")
                ),
                SizedBox(width:Get.width*.05),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                        txt: controller.user!.name.toString(),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomText(txt: controller.user!.email.toString())
                  ],
                ),
              ],
            ),
            SizedBox(height: Get.height*.1,),
            Expanded(
              child:ListView (
                children: [
                  CustomRow(
                      iconData:Icons.edit,
                      txt: "Edit Profile",

                  ),
                  CustomRow(
                      iconData:Icons.location_on_outlined,
                      txt: "Shipping Address",

                  ),
                  CustomRow(
                      iconData:Icons.watch_later_outlined,
                      txt: "Order History",
                      onTap: (){
                        Get.to(()=>OrderHistoryScreen());
                      },
                  ),
                  CustomRow(
                      iconData:Icons.card_giftcard_outlined,
                      txt: "Catds",

                  ),
                  CustomRow(
                      iconData:Icons.notifications_none,
                      txt: "Notifications",

                  ),
                  CustomRow(
                      iconData:Icons.logout,
                      txt: "Log Out",

                  ),
                ],
              ) ,
            )
          ],
        ),
      ),
    );
  }
}

class CustomRow extends StatelessWidget {
   CustomRow({
    Key? key,
    required this.iconData,
    required this.txt,
     this.onTap,
  }) : super(key: key);
  IconData iconData;
  String txt;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Icon(iconData,color: primaryColor,),
            SizedBox(width: Get.width*.06,),
            CustomText(txt: txt,fontSize: 18,),
            Spacer(),
            Icon(Icons.arrow_forward_ios_sharp)
          ],
        ),
      ),
    );
  }
}
