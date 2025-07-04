import 'package:flutter/material.dart';

import 'route/app_router.dart' as router;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wallet Hunter',
      onGenerateRoute: router.generateRoute,
    );
  }
}
