import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';

Widget addVerticalSpace(double height) {
  return SizedBox(height: height);
}

Widget addHorizontalSpace(double width) {
  return SizedBox(width: width);
}

snackBar(String title, String message) {
  if (GetPlatform.isAndroid) {
    Get.snackbar(title, message, snackPosition: SnackPosition.BOTTOM);
  } else if (GetPlatform.isWeb) {
    showToast(
      message,
      position: ToastPosition.bottom,
      backgroundColor: Colors.black.withOpacity(0.8),
      radius: 13.0,
      textPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      textStyle: TextStyle(fontSize: 18.0, color: Colors.white),
      animationBuilder: Miui10AnimBuilder(),
    );
  }
}
