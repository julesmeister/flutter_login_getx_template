import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_getx_template/screens/authentication/AuthBinding.dart';
import 'package:flutter_login_getx_template/screens/authentication/Login.dart';
import 'package:flutter_login_getx_template/screens/authentication/AuthController.dart';
import 'package:flutter_login_getx_template/screens/authentication/user.dart';
import 'package:flutter_login_getx_template/screens/landing/Landing.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (GetPlatform.isAndroid) await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return GetPlatform.isAndroid ? materialApp : OKToast(child: materialApp);
  }

  final materialApp = GetMaterialApp(
    initialBinding: AuthBinding(),
    debugShowCheckedModeBanner: false,
    title: 'Flutter Demo',
    theme: ThemeData(
      // This is the theme of your application.
      //
      // Try running your application with "flutter run". You'll see the
      // application has a blue toolbar. Then, without quitting the app, try
      // changing the primarySwatch below to Colors.green and then invoke
      // "hot reload" (press "r" in the console where you ran "flutter run",
      // or simply save your changes to "hot reload" in a Flutter IDE).
      // Notice that the counter didn't reset back to zero; the application
      // is not restarted.
      primarySwatch: Colors.blue,
    ),
    home: Root(),
  );
}

class Root extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext ctx) {
    return GetX(
      initState: (_) async {
        Get.put(UserController());
      },
      builder: (_) {
        return Get.find<AuthController>().user != null ? LandingPage() : Login();
      },
    );
  }
}
