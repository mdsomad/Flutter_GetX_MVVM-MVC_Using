import 'package:flutter/material.dart';
import 'package:flutter_getx_mvvm_mvc/res/Components/round_button.dart';
import 'package:flutter_getx_mvvm_mvc/utils/utils.dart';
import 'package:flutter_getx_mvvm_mvc/view_model/controller/login/login_view_controller.dart';
import 'package:get/get.dart';

class LoginButtonWidget extends StatelessWidget {
  final formkey;
  LoginButtonWidget({super.key, required this.formkey});

  LoginViewController loginViewController = Get.put(LoginViewController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => RoundButton(         //* <-- Call This RoundButton Component
        white: 200,
        title: 'login'.tr,
        loading: loginViewController.loading.value,
        onPress: () {
          if (formkey.currentState!.validate()) {
            loginViewController.loginApi();
          }
        }));



  }
}
