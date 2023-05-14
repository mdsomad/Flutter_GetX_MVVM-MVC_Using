# flutter_getx_mvvm_mvc

<!-- - [Supported languages country codes website link Click Now](https://api.flutter.dev/flutter/flutter_localizations/GlobalMaterialLocalizations-class.html) -->
- [Free Test & Practice API Link Check Now Http request & Api Hite A](https://reqres.in)

A new Flutter project.
- 1:How to User token Save local storage Manage User Session





## Manage User Session Ui Preview


<table>
  
  
<tr> 
   <th>Login Successfully View</th>
   <th>Home Screen View</th>
</tr>  
  
  
  
<tr>


<td>
  <img src="https://github.com/mdsomad/Flutter_GetX_MVVM-MVC_Using/assets/103892160/db145dc0-105d-4e58-b288-fb3e764f0f99" alt="Login Successfully View Example" width="260"/>
</td>
  
  
<td>
  <img src="https://github.com/mdsomad/Flutter_GetX_MVVM-MVC_Using/assets/103892160/6eee41cd-8e95-4b86-8abf-11b770a7a5b0" alt="Home Screen View Example" width="260"/>
</td>



  
</tr>

</table>





- 3: TODO Create UserModel Class code
```sh
class UserModel {
  String? token;
  bool? isLogin;

  UserModel({this.token,this.isLogin});

  UserModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    isLogin = json['isLogin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['isLogin'] = this.isLogin;
    return data;
  }
}

```














- 1: TODO Create UserPreference class  saveUser data local storage
```sh

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../models/login/UserModel.dart';





class UserPreference {


//TODO Create saveUser Function
Future<bool> saveUser(UserModel responseModel)async{
   SharedPreferences sp = await SharedPreferences.getInstance();
   sp.setString("token", responseModel.token.toString());
   sp.setBool("isLogin", responseModel.isLogin!);
   
    return true;

  }



//TODO Create getUser Function
Future<UserModel> getUser()async{
   SharedPreferences sp = await SharedPreferences.getInstance();
   String? token = sp.getString("token");
   bool? isLogin = sp.getBool("isLogin");
   
    return UserModel(
      token:token,
      isLogin:isLogin
    );
  }






//TODO Create removeUser Function
Future<bool> removeUser()async{
   SharedPreferences sp = await SharedPreferences.getInstance();
   sp.clear();
   return true;
}
  
  

   
}



```














- 3: saveUser Function call
```sh
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_mvvm_mvc/models/login/UserModel.dart';
import 'package:flutter_getx_mvvm_mvc/repository/login_repository.dart';
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
       

      //* Call This saveUser Data Function
       userPreference.saveUser(userModel).then((value){
         Get.toNamed(RouteName.homeScreen);
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




```










- 3: Check User Login then redirect screens
```sh
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




```









- 3: removeUser this Function then user logout
```sh
import 'package:flutter/material.dart';
import 'package:flutter_getx_mvvm_mvc/res/Routes/routes_name.dart';
import 'package:get/get.dart';
import '../../view_model/controller/user_preference/user_preference_view_model.dart';




class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

UserPreference userPreference = UserPreference();   //* <-- This UserPreference class Create Instance &  Object


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Home Screen"),
          actions: [
            IconButton(onPressed: (){
               //* Call This removeUser Function
              userPreference.removeUser().then((value){    
                  Get.toNamed(RouteName.loginView);
              });   

            }, icon:Icon(Icons.logout))
          ],
        ),
    );
  }
}




```







