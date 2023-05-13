import 'package:flutter/material.dart';
import 'package:flutter_getx_mvvm_mvc/res/Components/general_exception.dart';
import 'package:flutter_getx_mvvm_mvc/res/Components/internet_exceptions_widget.dart';
import 'package:flutter_getx_mvvm_mvc/res/Components/round_button.dart';
import 'package:flutter_getx_mvvm_mvc/res/assets/image_asset.dart';
import 'package:flutter_getx_mvvm_mvc/res/fonts/app_fonts.dart';
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
      body:
      
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          RoundButton(title: "Login", onPress:(){},white: double.infinity,loading: true,),

          const SizedBox(height: 20,),

          RoundButton(title: "SignUp", onPress:(){},white: 200),
        ],
      )
      
    );
  }
}