import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_getx_mvvm_mvc/res/Routes/routes.dart';
import 'package:flutter_getx_mvvm_mvc/res/Routes/routes_name.dart';
import 'package:flutter_getx_mvvm_mvc/view/login/login_view.dart';
import 'package:get/get.dart';
import '../controller/user_preference/user_preference_view_model.dart';



class SplashServices {

UserPreference userPreference = UserPreference();   //* <-- This UserPreference class Create Instance & Object
  

  
  void isLogin() {     //* <-- This Function call splash screen        
    
    //*  Call This getUser function
    userPreference.getUser().then((value){

       if(kDebugMode){
         print("Token Value --> ${value.token}");
         print("isLogin Value --> ${value.isLogin}");
       }

       if(value.isLogin == false || value.isLogin.toString() == "null"){
          Timer(Duration(seconds: 3), () => Get.toNamed(RouteName.loginView));    
       }else{
          Timer(Duration(seconds: 3), () => Get.toNamed(RouteName.homeScreen));
       }
    });
  }
}
