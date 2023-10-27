import 'package:flutter/material.dart';
import 'package:workapp/helpers/navigation.dart';
import 'package:workapp/screens/splash/view.dart';

class WorkApp extends StatelessWidget {
  const WorkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      navigatorKey: navigatorKey,
      onGenerateRoute: onGenerateRoute,
      home: const SplashScreen(),
    );
  }
}
