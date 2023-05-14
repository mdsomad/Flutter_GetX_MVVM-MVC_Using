

import 'dart:ffi';

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
    Get.snackbar(title, message,
    colorText: Colors.black,
    backgroundColor: Colors.green
    );
 }






  //TODO sanckBarError function
 static sanckBarError(String title, String message){
    Get.snackbar(title, message,
    colorText: Colors.white,
    icon: Icon(Icons.error,color: Colors.white,),
    backgroundColor: Colors.red
    );
 }







  
  
}