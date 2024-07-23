import 'package:flutter/material.dart';

class Routes {
  static Future<void> push(BuildContext context, Widget route) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => route,
      ),
    );
  }

  static Future<void> pushReplacement(BuildContext context, Widget route) {
    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => route,
      ),
    );
  }

  static Future<void> pushnamed(BuildContext context, String route) {
    return Navigator.pushNamed(context, route);
  }

  static Future<void> pushnamedAndRemovedUntil(
      BuildContext context, String route) {
    return Navigator.pushNamedAndRemoveUntil(context, route, (_) => false);
  }
}
