import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/const.dart';
import 'package:flutter_e_commerce/controller/authController.dart';
import 'package:flutter_e_commerce/view/auth/sign_up_screen.dart';
import 'package:flutter_e_commerce/widgets/customContainer.dart';
import 'package:flutter_e_commerce/widgets/customElevatedBottom.dart';
import 'package:flutter_e_commerce/widgets/customText.dart';
import 'package:flutter_e_commerce/widgets/customTextFormField.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {
  AuthController _controller=Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    txt: "Welcome",
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                  InkWell(
                    onTap: (){
                      Get.to(SignUpScreen());
                    },
                    child: CustomText(
                      txt: "Sign Up",
                      color: primaryColor,
                      fontSize: 23,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * .01,
              ),
              CustomText(
                txt: "Sign in to continue",
                color: Colors.grey,
                alignment: AlignmentDirectional.centerStart,
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
                height: Get.height * .01,
              ),
              CustomText(
                txt: "Forgot Password ?",
                alignment: AlignmentDirectional.centerEnd,
              ),
              SizedBox(
                height: Get.height * .01,
              ),
              CustomElevatedButton(
                onpressed: () {
                  _controller.signInWithEmailAndPassword();
                },
                txt: "Sign In",
                alignment: Alignment.center,
              ),
              SizedBox(
                height: Get.height * .04,
              ),
              CustomText(txt: "-OR-",alignment: Alignment.center,),
              SizedBox(
                height: Get.height * .02,
              ),
              CustomContainer(
                  txt: "sign in with Facebook",
                  imagePath: "asset/images/facebook.png"),
              SizedBox(
                height: Get.height * .02,
              ),
              CustomContainer(
                  txt: "sign in with Google",
                  imagePath: "asset/images/google.png")
            ],
          ),
        ),
      ),
    );
  }
}
