import 'package:flutter/cupertino.dart';
import 'package:flutter_e_commerce/view/auth/sign_in_screen.dart';
import 'package:flutter_e_commerce/view/home_screen.dart';
import 'package:get/get.dart';

import '../controller/local_storage_data.dart';

class ControlHomeScreen extends StatelessWidget {
   ControlHomeScreen({Key? key}) : super(key: key);
   final controller=Get.put(LocalStorageData());
  @override
  Widget build(BuildContext context) {
    return controller.isSignIn?HomeScreen():SignInScreen();
  }
}
