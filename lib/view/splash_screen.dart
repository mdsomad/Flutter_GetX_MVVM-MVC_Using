import 'package:flutter/material.dart';
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
      body: Column(
        children: [
          Image(
            image:AssetImage(ImageAssets.splashScreen)
            ),

          const SizedBox(
              height: 10,
            ),

            Text("Use Font Demo",style: TextStyle(fontSize: 40,fontFamily: AppFonts.dancingScript),)
        ],
      )
      
    );
  }
}