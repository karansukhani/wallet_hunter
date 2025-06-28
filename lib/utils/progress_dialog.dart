import 'package:flutter/material.dart';
import 'package:wallet_hunter/utils/color_constants.dart';

class ProgressDialog {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const PopScope(
          canPop: false,
          child: Dialog(
            shape: CircleBorder(),
            child: Wrap(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(
                      child: CircularProgressIndicator(
                    color: purple,
                  )),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
