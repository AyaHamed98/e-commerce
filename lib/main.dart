import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_e_commerce/controller/authController.dart';
import 'package:flutter_e_commerce/helper/binding/binding.dart';
import 'package:flutter_e_commerce/helper/shaesPrefs.dart';
import 'package:flutter_e_commerce/theme/theme.dart';
import 'package:flutter_e_commerce/view/auth/sign_in_screen.dart';
import 'package:flutter_e_commerce/view/home_screen.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await LocalData.inti();
  runApp( MyApp());
  SystemChrome.setSystemUIOverlayStyle(
     const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
  ));


}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);
   LocalData data =LocalData();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
     // home: data.getDataBool(key: "isSignIn")?SignInScreen():HomeScreen(),
      home: FirebaseAuth.instance.currentUser==null?SignInScreen():HomeScreen(),
      theme: getTheme(),
      debugShowCheckedModeBanner: false,
      initialBinding: BindingsClass(),
    );
  }
}

