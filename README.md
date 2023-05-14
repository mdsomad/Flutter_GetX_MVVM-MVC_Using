# flutter_getx_mvvm_mvc

<!-- - [Supported languages country codes website link Click Now](https://api.flutter.dev/flutter/flutter_localizations/GlobalMaterialLocalizations-class.html) -->
- [Free Test & Practice API Link Check Now Http request & Api Hite A](https://reqres.in)

A new Flutter project.
- 1:Login Api Add





## Login Api integrated Ui Preview


<table>
  
  
<tr> 
   <th>Login Successfully View</th>
   <th>No internet Error View</th>
   <th>User not found Error View</th>
</tr>  
  
  
  
<tr>


<td>
  <img src="https://github.com/mdsomad/Flutter_GetX_MVVM-MVC_Using/assets/103892160/db145dc0-105d-4e58-b288-fb3e764f0f99" alt="Login Successfully View Example" width="260"/>
</td>


<td>
  <img src="https://github.com/mdsomad/Flutter_GetX_MVVM-MVC_Using/assets/103892160/01cf0c40-2b9b-4886-8631-7b716e8f74ba" alt="No internet Error View Example" width="260"/>
</td>
  
  
<td>
  <img src="https://github.com/mdsomad/Flutter_GetX_MVVM-MVC_Using/assets/103892160/6eee41cd-8e95-4b86-8abf-11b770a7a5b0" alt="User not found Error View Example" width="260"/>
</td>



  
</tr>

</table>





- 3: TODO Class SplashServices code
```sh
import 'package:flutter_getx_mvvm_mvc/data/network/network_api_services.dart';
import 'package:flutter_getx_mvvm_mvc/res/app_url/app_url.dart';



class LoginRepository {

  final _apiService = NetworkApiServices();    //* <-- NetworkApiServices class Create Instance & Object
  
  //TODO loginApi Function
  Future<dynamic> loginApi(var data)async{
    dynamic response  = _apiService.postApi(data,AppUrl.loginApi);
    return response;
  }

}

```


















## Api Hit codes Stard
- 1: TODO Create LoginViewController class for login
```sh

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_mvvm_mvc/repository/login_repository.dart';
import 'package:flutter_getx_mvvm_mvc/utils/utils.dart';
import 'package:get/get.dart';





class LoginViewController extends GetxController {


  final _api = LoginRepository();   //* <-- This LoginRepository class Create Instance &  Object

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







