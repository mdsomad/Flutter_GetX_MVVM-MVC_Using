import 'package:flutter/material.dart';
import 'package:flutter_getx_mvvm_mvc/utils/utils.dart';
import 'package:flutter_getx_mvvm_mvc/view_model/controller/login/login_view_controller.dart';
import 'package:get/get.dart';




class InputEmailWidget extends StatelessWidget {
   InputEmailWidget({super.key});

 LoginViewController loginViewController = Get.put(LoginViewController());
  
  
  
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
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
                  );
  }
}