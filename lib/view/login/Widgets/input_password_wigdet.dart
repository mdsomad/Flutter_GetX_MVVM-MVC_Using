import 'package:flutter/material.dart';
import 'package:flutter_getx_mvvm_mvc/utils/utils.dart';
import 'package:flutter_getx_mvvm_mvc/view_model/controller/login/login_view_controller.dart';
import 'package:get/get.dart';





class InputPasswordWidget extends StatelessWidget {
  InputPasswordWidget({super.key});
  LoginViewController loginViewController = Get.put(LoginViewController());

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: loginViewController.passwordController.value,
      focusNode: loginViewController.emailFocusNode.value,
      obscureText: true,
      obscuringCharacter: "*",
      decoration: InputDecoration(
          hintText: 'password_hint'.tr, border: OutlineInputBorder()),
          
      validator: (value) {
        if (value!.isEmpty) {
          Utils.sanckBar("Password", "Enter password");
        }
      },
      onFieldSubmitted: (value) {},
    );




  }
}
