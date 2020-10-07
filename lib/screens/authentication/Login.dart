import 'package:flutter/material.dart';
import 'package:flutter_login_getx_template/utils/widget_functions.dart';
import 'package:get/get.dart';

import 'AuthController.dart';

class Login extends GetWidget<AuthController> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(),
          Padding(
            padding: const EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Center(
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _usernameController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                hintText: "Enter email", labelText: "Email"),
                          ),
                          addVerticalSpace(20),
                          TextFormField(
                            controller: _passwordController,
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            decoration: InputDecoration(
                                hintText: "Enter password",
                                labelText: "Password"),
                          ),
                          addVerticalSpace(20),
                          RaisedButton(
                            onPressed: () {
                              controller.login(_usernameController.text,
                                  _passwordController.text);
                            },
                            child: Text('Sign In'),
                            color: Colors.blue,
                            textColor: Colors.white,
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
