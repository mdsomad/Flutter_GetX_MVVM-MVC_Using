import 'package:flutter_getx_mvvm_mvc/res/Routes/routes_name.dart';
import 'package:flutter_getx_mvvm_mvc/view/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  
  static appRoutes ()=>[
     GetPage(name:RouteName.splashScreen, page: () => SplashScreen(),transitionDuration: Duration(milliseconds: 250),transition: Transition.rightToLeftWithFade)
  ];
    
}