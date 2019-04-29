import 'package:flutter/material.dart';
import 'ui/login_screen.dart';

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Virtual Shelf',
      home: Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}