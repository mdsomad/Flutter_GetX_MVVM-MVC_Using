import 'package:flutter/material.dart';
import 'package:flutter_getx_mvvm_mvc/res/Components/general_exception.dart';
import 'package:flutter_getx_mvvm_mvc/res/Components/internet_exceptions_widget.dart';
import 'package:flutter_getx_mvvm_mvc/res/Components/round_button.dart';
import 'package:flutter_getx_mvvm_mvc/res/assets/image_asset.dart';
import 'package:flutter_getx_mvvm_mvc/res/fonts/app_fonts.dart';
import 'package:flutter_getx_mvvm_mvc/view_model/services/solash_services.dart';
import 'package:get/get.dart';





class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SsplashScreenState();   //* <-- SplashServices calss Object
}

class SsplashScreenState extends State<SplashScreen> {

SplashServices splashServices = SplashServices();   //* <-- This SplashServices class Create Instance &  Object

@override
  void initState() {
    // TODO: implement initState
    splashServices.isLogin();  //* <-- Call This isLogin() Function
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.teal,
      body: Center(
        child: Text('welcome_back'.tr,textAlign: TextAlign.center,),
      ),
    );
  }
}