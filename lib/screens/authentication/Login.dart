import 'package:flutter/material.dart';
import 'package:flutter_login_getx_template/custom/AuthLogo.dart';
import 'package:flutter_login_getx_template/screens/authentication/SignUp.dart';
import 'package:flutter_login_getx_template/utils/widget_functions.dart';
import 'package:get/get.dart';

import 'AuthController.dart';

class Login extends GetWidget<AuthController> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Card(
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 0, left: 16, right: 16, bottom: 10),
                      child: Column(
                        children: [
                          AuthLogo(),
                          TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: _usernameController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  hintText: "Enter email",
                                  labelText: "Email",
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  border: OutlineInputBorder()),
                              validator: (val) {
                                if (val.isEmpty) return 'Empty';
                                if (!val.isEmail) return 'Enter a valid email';
                                return null;
                              }),
                          addVerticalSpace(20),
                          TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: _passwordController,
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              decoration: InputDecoration(
                                  hintText: "Enter password",
                                  labelText: "Password",
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  border: OutlineInputBorder()),
                              validator: (val) {
                                if (val.isEmpty) return 'Empty';
                                return null;
                              }),
                          addVerticalSpace(20),
                          RaisedButton(
                            onPressed: () {
                              if (!_formKey.currentState.validate())
                                return;
                              else
                                controller.login(_usernameController.text,
                                    _passwordController.text);
                            },
                            child: Text('Sign In'),
                            color: Colors.blue,
                            textColor: Colors.white,
                          ),
                          FlatButton(
                            onPressed: () {
                              Get.offAll(SignUp());
                            },
                            child: Text("Sign Up"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
