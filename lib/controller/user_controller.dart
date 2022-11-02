import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_e_commerce/helper/firestore_user.dart';
import 'package:flutter_e_commerce/models/user_model.dart';
import 'package:get/get.dart';

class UserController extends GetxController{

  UserModel? user;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUserData();
  }
   getUserData()async{
    await FireStoreUser().getUserFromFirebase().then((value) {
      user=UserModel.fromJson(value);
    });
  }
  FirebaseAuth _auth= FirebaseAuth.instance;
  void logOut(){
    
  }

}