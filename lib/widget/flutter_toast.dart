import 'package:flutter/material.dart';



mixin FlutterToast {
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> show(BuildContext context, String message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          child: Text(
            message,
            style: const TextStyle(
              color: Color(0xffffffff),
              fontSize: 14,

              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        backgroundColor: const Color(0xff000000),
        elevation: 8.0,
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        margin: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 15,
        ),
      ),
    );
  }
}
