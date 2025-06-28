import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Future<void> showSnackBarGreen(BuildContext context, String message, {int sec = 3, double bottomPadding = 8}) async {
  await _customSnack(
    context,
    message,
    Colors.green.shade400,
    FontAwesomeIcons.solidCircleCheck,
    sec: sec,
    bottomPadding: bottomPadding,
  );
}

Future<void> showSnackBarRed(BuildContext context, String message, {int sec = 3, double bottomPadding = 8}) async {
  await _customSnack(
    context,
    message,
    Colors.red.shade400,
    FontAwesomeIcons.triangleExclamation,
    sec: sec,
    bottomPadding: bottomPadding,
  );
}

Future<void> _customSnack(
  BuildContext context,
  String message,
  Color color,
  IconData icon, {
  int sec = 3,
  double bottomPadding = 8,
}) async {
  await Flushbar(
    message: message,
    backgroundColor: color,
    margin: EdgeInsets.fromLTRB(8, 8, 8, bottomPadding),
    borderRadius: BorderRadius.circular(8),
    animationDuration: const Duration(milliseconds: 500),
    icon: Icon(
      icon,
      color: Colors.white,
      size: 18,
    ),
    duration: Duration(seconds: sec),
  ).show(context);
}
