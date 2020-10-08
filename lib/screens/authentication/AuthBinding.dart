import 'package:flutter_login_getx_template/screens/authentication/user.dart';
import 'package:get/get.dart';
import 'AuthController.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserController());
    Get.lazyPut<AuthController>(() => AuthController());
  }
}
