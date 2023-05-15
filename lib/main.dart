import 'package:flutter/material.dart';
import 'package:flutter_getx_mvvm_mvc/res/Routes/routes.dart';
import 'package:flutter_getx_mvvm_mvc/res/getx_locallzation/languages.dart';
import 'package:flutter_getx_mvvm_mvc/view/splash_screen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}






class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Languages(),          //* Languages This class
      locale: Locale('en','US'),          //* <-- Save Value assign this (shared preference use kare to)
      fallbackLocale: Locale('en','US'),  //* Add This Code
      
      debugShowCheckedModeBanner: false,
      title: 'Flutter GetX MVVM/MVC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      getPages:AppRoutes.appRoutes(),

    );
  }
}








// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

  
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       translations: Languages(),          //* Add This Code
//       locale: Locale('en','US'),          //* <-- Save Value assign this (shared preference use kare to)
//       fallbackLocale: Locale('en','US'),  //* Add This Code
      
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter GetX MVVM/MVC',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: SplashScreen(),


//     );
//   }
// }