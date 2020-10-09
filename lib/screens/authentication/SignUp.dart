import 'package:flutter/material.dart';
import 'package:flutter_login_getx_template/custom/AuthLogo.dart';
import 'package:flutter_login_getx_template/screens/authentication/Login.dart';
import 'package:flutter_login_getx_template/utils/widget_functions.dart';
import 'package:get/get.dart';

import 'AuthController.dart';

class SignUp extends GetWidget<AuthController> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();
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
                          top: 28, left: 16, right: 16, bottom: 10),
                      child: Column(
                        children: [
                          AuthLogo(),
                          TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: _nameController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                  hintText: "Enter name",
                                  labelText: "Name",
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  border: OutlineInputBorder()),
                              validator: (val) {
                                if (val.isEmpty) return 'Empty';
                                return null;
                              }),
                          addVerticalSpace(20),
                          TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: _emailController,
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
                          TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: _confirmController,
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: "Confirm password",
                                labelText: "Confirm",
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                border: OutlineInputBorder(),
                              ),
                              validator: (val) {
                                if (val.isEmpty) return 'Empty';
                                if (val != _passwordController.text)
                                  return 'Not Match';
                                return null;
                              }),
                          addVerticalSpace(20),
                          RaisedButton(
                            onPressed: () {
                              if (!_formKey.currentState.validate())
                                return;
                              else
                                controller.createUser(_nameController.text, _emailController.text,
                                    _passwordController.text);
                            },
                            child: Text('Sign Up'),
                            color: Colors.blue,
                            textColor: Colors.white,
                          ),
                          FlatButton(
                            onPressed: () {
                              Get.offAllNamed("login");
                            },
                            child: Text("Log In"),
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
