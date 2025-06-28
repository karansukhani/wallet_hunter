import 'package:flutter/material.dart';
import 'package:wallet_hunter/route/routing_constant.dart';
import 'package:wallet_hunter/screens/add_family_member_screen/add_family_member_screen.dart';
import 'package:wallet_hunter/screens/add_family_member_screen/arguments/edit_family_member_arguments.dart';
import 'package:wallet_hunter/screens/associated_temples_list_screen/temple_list_screen.dart';
import 'package:wallet_hunter/screens/family_member_list_screen/family_member_list_screen.dart';
import 'package:wallet_hunter/screens/family_tree_screen/family_tree_screen.dart';
import 'package:wallet_hunter/screens/head_registration_screen/head_registration_screen.dart';
import 'package:wallet_hunter/screens/login_screen/login_screen.dart';
import 'package:wallet_hunter/screens/splash_screen/splash_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case splashScreenRoute:
      return MaterialPageRoute(builder: (_) => SplashScreen());
    case loginScreenRoute:
      return MaterialPageRoute(builder: (_) => LoginScreen.create());
    case headRegistrationScreenRoute:
      return MaterialPageRoute(builder: (_) => HeadRegistrationScreen.create());

    case familyMemberListScreenRoute:
      return MaterialPageRoute(builder: (_) => FamilyMemberListScreen.create());

    case addFamilyMemberFormScreenRoute:
      return MaterialPageRoute(
          builder: (_) => FamilyMemberFormScreen.create(settings.arguments as EditFamilyMemberArguments));
    case familyTreeScreenRoute:
      return MaterialPageRoute(builder: (_) => FamilyTreeScreen.create());

    case templeListScreenRoute:
      return MaterialPageRoute(builder: (_) => TempleListScreen());
    default:
      return MaterialPageRoute(builder: (_) {
        return Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        );
      });
  }
}
