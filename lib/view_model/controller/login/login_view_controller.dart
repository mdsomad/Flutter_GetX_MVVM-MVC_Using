import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_mvvm_mvc/models/login/UserModel.dart';
import 'package:flutter_getx_mvvm_mvc/repository/login_repository/login_repository.dart';
import 'package:flutter_getx_mvvm_mvc/res/Routes/routes_name.dart';
import 'package:flutter_getx_mvvm_mvc/utils/utils.dart';
import 'package:flutter_getx_mvvm_mvc/view_model/controller/user_preference/user_preference_view_model.dart';
import 'package:get/get.dart';

class LoginViewController extends GetxController {


  final _api = LoginRepository();   //* <-- This LoginRepository class Create Instance &  Object

  UserPreference userPreference = UserPreference();    //* <-- This UserPreference class Create Instance &  Object
  
  

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;






  //TODO Create loginApi Function
  void loginApi() {
    loading.value = true;
    Map data = {
      "email": emailController.value.text,
      "password": passwordController.value.text
    };

    _api.loginApi(data).then((value) {
      loading.value = false;

      if (value['error'] == 'user not found') {
        
        Utils.sanckBarError("Login", value['error']);

      } else {
       



      //* This UserModel class Create Instance & Object
       UserModel userModel = UserModel(
          token: value['token'],
          isLogin: true
       );
       
      //* Call This saveUser Data function
       userPreference.saveUser(userModel).then((value){

         Get.delete<LoginViewController>();    //* <-- Ram Free
        
         Get.toNamed(RouteName.homeScreen)!.then((value){});
         
        }).onError((error, stackTrace){
           if(kDebugMode){
            print(error.toString());
           }
        });




        Utils.sanckBar("Login", "Login successfully");
      }

    }).onError((error, stackTrace) {
      loading.value = false;
      if (kDebugMode) {
        print(error.toString());
      }
      Utils.sanckBarError("Error", error.toString());
    });


    
  }
}
