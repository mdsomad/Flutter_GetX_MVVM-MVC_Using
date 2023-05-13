import 'package:flutter/material.dart';
import 'package:get/get.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SsplashScreenState();
}

class SsplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            'splash_screen'.tr,style: TextStyle(color: Colors.pink,fontSize:40),
          ),
        ),
      ),
    );
  }
}