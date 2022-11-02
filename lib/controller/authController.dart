import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_e_commerce/helper/firestore_user.dart';
import 'package:flutter_e_commerce/helper/shaesPrefs.dart';
import 'package:flutter_e_commerce/models/user_model.dart';
import 'package:flutter_e_commerce/view/home_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController{
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController nameController=TextEditingController();
  FirebaseAuth _auth=FirebaseAuth.instance;
  String? displayName;
  Future<void>signUpWithEmailAndPassword()async{
    try {
      await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      ).then((value)async {
            await saveData(value);
          Get.offAll(HomeScreen());


      });


    } on FirebaseAuthException catch (e) {
      String title=e.code.replaceAll(RegExp("-"), " ");
      String message="";
      if (e.code == 'weak-password') {
       message="The password provided is too weak";
      } else if (e.code == 'email-already-in-use') {
        message="The account already exists for that email";
      }
      Get.snackbar(title, message);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> saveData(UserCredential value)async {
      await FireStoreUser().addUserForFireStore(UserModel(
        id: value.user!.uid,
        name: nameController.text==null?value.user?.displayName:nameController.text,
        email: value.user!.email,
        pic: ""
    ));
  }


  Future<void>signInWithEmailAndPassword()async{
    try {
         await _auth.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text
      ).then((value)async{

        Get.offAll(HomeScreen());
        emailController.clear();
         });
    } on FirebaseAuthException catch (e) {
      String title=e.code.replaceAll(RegExp("-"), " ");
      String message="";
      if (e.code == 'user-not-found') {
        message='No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message="Wrong password provided for that user.";
      }
      Get.snackbar(title, message);
    }catch(e){
      Get.snackbar("Error!", e.toString());

    }
  }






}