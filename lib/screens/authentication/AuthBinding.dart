import 'package:get/get.dart';
import 'AuthController.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => GetLifeCycle());
    Get.lazyPut<AuthController>(() => AuthController());
  }
}
