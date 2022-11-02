import 'package:flutter_e_commerce/controller/authController.dart';
import 'package:get/get.dart';

import '../../controller/explore_controller.dart';

class BindingsClass extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.put(CategoryController());
  }

}