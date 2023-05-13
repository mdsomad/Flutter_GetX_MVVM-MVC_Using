# flutter_getx_mvvm_mvc

- [Supported languages country codes website link Click Now](https://api.flutter.dev/flutter/flutter_localizations/GlobalMaterialLocalizations-class.html)


A new Flutter project.
- 1: App Strings & GetX Localization Languages Supported code



- 1: TODO Create Languages class
```sh
import 'package:get/get.dart';

class Languages extends Translations{

  //TODO Map
  @override
   Map<String,Map<String,String>> get keys =>{
  
    'en_Us':{                                    //* <-- Add multiple languages
      "splash_screen":"Splash Screen"
    },

    'hi_IN':{
      "splash_screen":"स्प्लैश स्क्रीन",
    }
    
     
   };

}
```





- 2: TODO Create SplashScreen
```sh
import 'package:flutter/material.dart';
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
      body: Container(
        child: Center(
          child: Text(

            // Languages add code
            'splash_screen'.tr,style: TextStyle(color: Colors.pink,fontSize:40),

          ),
        ),
      ),
    );
  }
}

```






## GetX English Language Ui Preview
 <img src=" " alt="App Language English View Example" width="260"/>
- 2: TODO GetMaterialApp set this code (English Languages set)
```sh
  GetMaterialApp(

      translations: Languages(),          //* Add This Code  ( Languages This cla)
      locale: Locale('en','US'),          //* <-- Save Value assign this (shared preference use kare to)
      fallbackLocale: Locale('en','US'),  //* Add This Code
      
      debugShowCheckedModeBanner: false,
      title: 'Flutter GetX MVVM/MVC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),


    );

```










### GetX Hindi Language Ui Preview
 <img src="" alt="App Language English View Example" width="260"/>
- 2: TODO GetMaterialApp set this code (Hindi Languages set)
```sh
  GetMaterialApp(

      translations: Languages(),          //* Add This Code  ( Languages This cla)
      locale: Locale('hi','IN'),          //* <-- Save Value assign this (shared preference use kare to)
      fallbackLocale: Locale('en','US'),  //* Add This Code
      
      debugShowCheckedModeBanner: false,
      title: 'Flutter GetX MVVM/MVC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),


    );

```











