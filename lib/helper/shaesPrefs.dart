
import 'package:shared_preferences/shared_preferences.dart';

class LocalData{

 static inti()async{
    SharedPreferences _prefs=await SharedPreferences.getInstance();
  }
  bool? isSignIn;
   Future<bool>setBool()async{
    SharedPreferences _prefs=await SharedPreferences.getInstance();
    return _prefs.setBool("isSignIn",isSignIn! );
  }
    getDataBool({required String key})async{
    SharedPreferences _prefs=await SharedPreferences.getInstance();
    isSignIn= _prefs.getBool("isSignIn")!;
    return isSignIn;
  }
}
