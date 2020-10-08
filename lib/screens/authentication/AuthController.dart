import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_getx_template/screens/landing/Landing.dart';
import 'package:flutter_login_getx_template/utils/widget_functions.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rx<User> _firebaseUser = Rx<User>();

  String get user => _firebaseUser.value?.email;

  @override
  void onInit() {
    super.onInit();

    _firebaseUser.bindStream(_auth.authStateChanges());
  }

  void createUser(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);
      snackBar("Success!", "Account created");
      Get.offAll(LandingPage());
    } catch (e) {
      snackBar("Error creating account", e.message);
    }
  }

  void login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password);
      Get.offAll(LandingPage());
    } catch (e) {
      print(e);
      snackBar("Error logging in", e.message);
    }
  }

  void signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      snackBar("Error signing out", e.message);
    }
  }
}
