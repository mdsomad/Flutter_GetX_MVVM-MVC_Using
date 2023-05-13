# flutter_getx_mvvm_mvc

A new Flutter project.
- 1: Utils Class tostMessage code



- 1: TODO Create AppColor class
```sh
import 'package:flutter/material.dart';

class AppColor{

  static const Color blackColor = Color(0xf000000);
  static const Color whiteColor = Color(0xffffffff);
  
}
```





- 2: TODO Create Utils class tostMessage finction
```sh
import 'package:flutter/material.dart';
import 'package:flutter_getx_mvvm_mvc/res/Colors/app_colors.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class Utils {

  //TODO fieldFocusChange function
  static void fieldFocusChange(BuildContext context,FocusNode current,FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }



  //TODO tostMessage function
  static tostMessage(String tostMessage){
     Fluttertoast.showToast(
      msg: tostMessage,
      backgroundColor: AppColor.blackColor,
      textColor: AppColor.whiteColor,
      gravity: ToastGravity.BOTTOM
      );    
  }



 //TODO sanckBar function
 static sanckBar(String title, String message){
    Get.snackbar(title, message);
 }

  
  
}

```