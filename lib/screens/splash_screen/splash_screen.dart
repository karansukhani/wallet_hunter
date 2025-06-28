import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wallet_hunter/route/routing_constant.dart';
import 'package:wallet_hunter/utils/shared_preference/pref_key.dart';
import 'package:wallet_hunter/utils/shared_preference/shared_pref.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static Widget create() => const SplashScreen();

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    redirectToScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Text(
          "Wallet Hunter",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.5,
          ),
        ),
      ),
    );
  }

  void redirectToScreen() async {
    bool isLogin = await SharedPref.getBool(PrefKey.isLogin);
    Timer(const Duration(seconds: 3), () {
      if (isLogin) {
        Navigator.of(context).pushReplacementNamed(familyMemberListScreenRoute);
      } else {
        Navigator.of(context).pushReplacementNamed(loginScreenRoute);
      }
    });
  }
}
