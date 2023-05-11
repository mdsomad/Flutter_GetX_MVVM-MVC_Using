import 'package:flutter/material.dart';
import 'package:flutter_getx_mvvm_mvc/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter GetX MVVM/MVC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen()
    );
  }
}

