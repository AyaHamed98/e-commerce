import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/controller/authController.dart';
import 'package:flutter_e_commerce/helper/shaesPrefs.dart';
import 'package:flutter_e_commerce/view/home_screen.dart';
import 'package:flutter_e_commerce/widgets/customText.dart';
import 'package:get/get.dart';

import '../../widgets/customElevatedBottom.dart';
import '../../widgets/customTextFormField.dart';

class SignUpScreen extends StatelessWidget {
   SignUpScreen({Key? key}) : super(key: key);
  AuthController _controller=Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: IconButton(
              onPressed: () {
                Get.back();
              }, icon: Icon(Icons.arrow_back_ios_outlined,color: Colors.grey,))),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: Get.height * .06,
              ),
              CustomText(
                txt: "Sign Up",
                fontSize: 28,
                fontWeight: FontWeight.bold,
                alignment: AlignmentDirectional.centerStart,
              ),
              SizedBox(
                height: Get.height * .1,
              ),
              CustomText(
                txt: "Name",
                color: Colors.grey,
                alignment: AlignmentDirectional.centerStart,
              ),
              CustomTextFormField(
                onSaved: (value) {},
                validator: (value) {},
                controller: _controller.nameController,
              ),
              SizedBox(
                height: Get.height * .05,
              ),
              CustomText(
                txt: "Email",
                color: Colors.grey,
                alignment: AlignmentDirectional.centerStart,
              ),
              CustomTextFormField(
                onSaved: (value) {},
                validator: (value) {},
                controller: _controller.emailController,
              ),
              SizedBox(
                height: Get.height * .05,
              ),
              CustomText(
                txt: "Password",
                color: Colors.grey,
                alignment: AlignmentDirectional.centerStart,
              ),
              CustomTextFormField(
                onSaved: (value) {},
                validator: (value) {},
                controller: _controller.passwordController,
              ),
              SizedBox(
                height: Get.height * .03,
              ),
              CustomElevatedButton(
                onpressed: ()async {
                 await _controller.signUpWithEmailAndPassword();
                 print(",,,,,,,,,,,,,,,,,,,,,,,");
                 print(LocalData().getDataBool(key: "isSignIn"));
                },
                txt: "Sign Up",
                alignment: Alignment.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
