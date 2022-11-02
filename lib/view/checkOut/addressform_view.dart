import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/controller/cart_controller.dart';
import 'package:flutter_e_commerce/widgets/customElevatedBottom.dart';
import 'package:flutter_e_commerce/widgets/customText.dart';
import 'package:flutter_e_commerce/widgets/customTextFormField.dart';
import 'package:flutter_e_commerce/widgets/custom_appBar.dart';
import 'package:flutter_e_commerce/widgets/custom_positioned.dart';
import 'package:flutter_e_commerce/widgets/positionedWidget.dart';
import 'package:get/get.dart';

class AddressFromView extends StatelessWidget {
   AddressFromView({Key? key}) : super(key: key);
   final controller =Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomBar(txt: "Checkout"),
        Expanded(
          child: Stack(
            children: [
              SizedBox(
                height: Get.height*.8,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 40),
                  child: Form(
                    key: controller.formKey,
                    child: ListView(
                      children: [
                        customRow(),
                        SizedBox(height: Get.height*.05,),
                        customForm(
                          txt: "Street",
                          controller: controller.streetCont,
                            hintTxt: "21,Alex Davidson Avenue"
                        ),
                        customForm(
                            txt: "City",
                            controller: controller.cityCont,
                            hintTxt: "Victoria Island"
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: Get.width*.4,
                              child: customForm(
                                  txt: "State",
                                  controller: controller.stateCont,
                                  hintTxt: "Victoria Island"
                              ),
                            ),
                            SizedBox(
                              width: Get.width*.4,

                              child: customForm(
                                  txt: "Country",
                                  controller: controller.countrytCont,
                                  hintTxt: "Victoria Island"
                              ),
                            ),
                          ],
                        )

                      ],
                    ),
                  ),
                ),
              ),
              PositinedWidget(
                  txt: "NEXT",
                  firstOnePressed: (){
                    controller.pageController!.previousPage(duration: Duration(milliseconds: 500), curve: Curves.linear);

                  },
                  secondPressed: (){
                    if(controller.formKey.currentState!.validate()){
                      controller.pageController!.nextPage(duration: Duration(milliseconds: 500), curve: Curves.linear);

                    }
                  }
              )
            ],
          ),
        ),
      ],
    );
  }

  Row customRow() {
    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                      Image.asset("asset/images/check.png",width: Get.width*.06,),
                      CustomText(txt: "Billing address is thesame as delivery address.",fontSize: 14,)
                      ],
                    );
  }



 Widget customForm({
   required String txt,
   required TextEditingController? controller,
   required String hintTxt
}){
    return Container(
      height: Get.height*.15,
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(txt: txt,color: Colors.grey,),
          CustomTextFormField(
            controller: controller,
            validator: (value){
              if(value!.isEmpty){
                return "fill the field" ;
              }
            },
            hintTxt: hintTxt,
          ),
        ],
      ),
    );
  }
}