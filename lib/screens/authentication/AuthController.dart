import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_getx_template/screens/authentication/Login.dart';
import 'package:flutter_login_getx_template/screens/authentication/user.dart';
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

  void createUser(String name, String email, String password) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(
              email: email.trim(), password: password)
          .then((value) async {
        // create user in firestore
        UserModel _user =
            UserModel(id: value.user.uid, name: name, email: email);
        print(_user);
        bool userCreated = await UserController().createNewUser(_user);
        if (userCreated) {
          Get.find<UserController>().user = _user;
          snackBar("Success!", "Account created");
          Get.offAll(LandingPage());
        }
      });
    } catch (e) {
      print(e.toString());
      snackBar("Error creating account", e.toString());
    }
  }

  void login(String email, String password) async {
    try {
      UserCredential _authResult = await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password);
      Get.find<UserController>().user =
          await UserController().getUser(_authResult.user.uid);
      // No need to Get.back
    } catch (e) {
      print(e);
      snackBar("Error logging in", e.message);
    }
  }

  void signOut() async {
    try {
      await _auth.signOut();
      Get.find<UserController>().clear();
      Get.offAll(Login());
    } catch (e) {
      snackBar("Error signing out", e.message);
    }
  }
}
