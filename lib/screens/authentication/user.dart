import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class UserModel {
  String id;
  String name;
  String email;

  UserModel({id, name, email});

  UserModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    this.id = doc.id;
    this.name = doc["name"];
    this.email = doc["email"];
  }
}

class UserController extends GetxController {
  Rx<UserModel> _userModel = UserModel().obs;
  UserModel get user => _userModel.value;
  set user(UserModel value) => this._userModel.value = value;
  void clear() {
    _userModel.value = UserModel();
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> createNewUser(UserModel user) async {
    try {
      await _firestore.collection("users").doc(user.id).set({
        "name": user.name,
        "email": user.email,
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<UserModel> getUser(String uid) async {
    try {
      return UserModel.fromDocumentSnapshot(
          await _firestore.collection("users").doc(uid).get());
    } catch (e) {
      rethrow;
    }
  }
}
