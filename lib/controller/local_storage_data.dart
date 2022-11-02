import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageData {
LocalStorageData(){
  isSignIn=getData()??false;

}
  String SIGNIN="signIn";
  static intiSharedPref()async{

    SharedPreferences _preferences=await SharedPreferences.getInstance();
  }

  static setData(bool isSign)async{
    SharedPreferences _preferences=await SharedPreferences.getInstance();

    _preferences.setBool("signIn",isSign);
  }


  bool isSignIn=false;
  getData()async{
    SharedPreferences _preferences=await SharedPreferences.getInstance();
    _preferences.get("signIn");
 }


}