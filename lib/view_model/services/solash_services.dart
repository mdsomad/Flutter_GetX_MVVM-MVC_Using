import 'dart:async';
import 'package:flutter_getx_mvvm_mvc/res/Routes/routes.dart';
import 'package:flutter_getx_mvvm_mvc/res/Routes/routes_name.dart';
import 'package:flutter_getx_mvvm_mvc/view/login/login_view.dart';
import 'package:get/get.dart';



class SplashServices {
  void isLogin() {
    Timer(Duration(seconds: 3), () => Get.toNamed(RouteName.loginView));
  }
}
