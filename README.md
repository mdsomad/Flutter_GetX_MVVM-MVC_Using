# flutter_getx_mvvm_mvc

<!-- - [Supported languages country codes website link Click Now](https://api.flutter.dev/flutter/flutter_localizations/GlobalMaterialLocalizations-class.html) -->


A new Flutter project.
- 1: Login Screen View Craete





## SplashScreen & LoginScreen Ui Preview


<table>
  
  
<tr> 
   <th>Splash Screen View</th>
   <th>Login Screen View</th>
   <th>Login Screen Error View</th>
</tr>  
  
  
  
<tr>


<td>
  <img src="https://github.com/mdsomad/Flutter_GetX_MVVM-MVC_Using/assets/103892160/48b97fd6-c0eb-458f-a99c-a6ff19de331c" alt="Splash Screen view Example" width="260"/>
</td>


<td>
  <img src="https://github.com/mdsomad/Flutter_GetX_MVVM-MVC_Using/assets/103892160/6089a54d-f6f9-46c1-9e89-443e77cd1da3" alt="Login Screeni view Example" width="260"/>
</td>
  
  
<td>
  <img src="https://github.com/mdsomad/Flutter_GetX_MVVM-MVC_Using/assets/103892160/a4a4d4c4-a0b8-4bb6-902c-ea2bf550800b" alt="Login Screeni Error view Example" width="260"/>
</td>



  
</tr>

</table>







- 3: TODO Class SplashServices code
```sh
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

```










- 3: SplashScreens code
```sh
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
  State<SplashScreen> createState() => SsplashScreenState();
}

class SsplashScreenState extends State<SplashScreen> {

SplashServices splashServices = SplashServices();   // <-- SplashServices calss Object

@override
  void initState() {
    // TODO: implement initState
    splashServices.isLogin();   //* <-- Call This isLogin()  Function
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

```















## Login Screen related codes Stard
- 1: TODO Create LoginViewController class for login
```sh

import 'package:flutter/material.dart';
import 'package:get/get.dart';



class LoginViewController extends GetxController{


  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;
 
  
}


```








- 2: LoginView code 
```sh

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_getx_mvvm_mvc/res/Components/round_button.dart';
import 'package:flutter_getx_mvvm_mvc/utils/utils.dart';
import 'package:get/get.dart';
import '../../view_model/controller/login_view_controller.dart';










class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {


  LoginViewController loginViewController = Get.put(LoginViewController());
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('login'.tr),
      ),


      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Form(
              key: _formkey,
              child: Column(
                children: [


                  TextFormField(
                    controller: loginViewController.emailController.value,
                    focusNode: loginViewController.emailFocusNode.value,
                    decoration: InputDecoration(
                        hintText: 'email_hint'.tr,
                        border: OutlineInputBorder()),


                    validator: (value) {
                      if (value!.isEmpty) {
                        Utils.sanckBar("Email", "Enter emai");
                      }
                    },


                    onFieldSubmitted: (value) {
                      Utils.fieldFocusChange(
                          context,
                          loginViewController.emailFocusNode.value,
                          loginViewController.passwordFocusNode.value);
                    },
                  ),


                  const SizedBox(
                    height: 20,
                  ),


                  TextFormField(
                    controller: loginViewController.passwordController.value,
                    focusNode: loginViewController.emailFocusNode.value,
                    obscureText: true,
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                        hintText: 'password_hint'.tr,
                        border: OutlineInputBorder()),


                    validator: (value) {
                      if (value!.isEmpty) {
                        Utils.sanckBar("Password", "Enter password");
                      }
                    },

                    onFieldSubmitted: (value) {},

                  ),



                ],
              ),
            ),


            const SizedBox(
              height: 40,
            ),

           
            RoundButton(      //* <-- Call RoundButton
                white: 200,
                title: 'login'.tr,
                onPress: () {
                  if (_formkey.currentState!.validate()) {}
                })


          ],
        ),
      ),
    );
  }
}



```


















- 5: Languages class code 
```sh
import 'package:get/get.dart';

class Languages extends Translations{


  //TODO Map
  @override
   Map<String,Map<String,String>> get keys => {
  
    'en_Us':{                                    //* <-- Add multiple languages
      "splash_screen":"Splash Screen",
      'internet_exception' : "We're unable tp show results.\nPtease check your\ninternet conenction.",
      'general_exception': "We're unable to process your request.\n Please try again",
      'welcome_back':"Welcome\nBack",
      'login':"Login",
      'email_hint':"Email",
      'password_hint':"Password",
    },

    'hi_IN':{
      "splash_screen":"स्प्लैश स्क्रीन",
      'internet_exception' : "हम परिणाम दिखाने में असमर्थ हैं।\nकृपया अपनी जाँच करें\nइंटरनेट कनेक्शन.",
      'general_exception': "हम आपके अनुरोध को संसाधित करने में असमर्थ हैं।\n कृपया पुन: प्रयास करें",
      'login':"लॉग इन करें",
      'email_hint':"ईमेल",
      'password_hint':"पासवर्ड",
    }
    
     
   };
}

```







