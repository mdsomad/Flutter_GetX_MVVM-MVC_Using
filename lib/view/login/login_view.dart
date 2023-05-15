import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_getx_mvvm_mvc/res/Components/round_button.dart';
import 'package:flutter_getx_mvvm_mvc/utils/utils.dart';
import 'package:flutter_getx_mvvm_mvc/view/login/Widgets/input_email_widget.dart';
import 'package:flutter_getx_mvvm_mvc/view/login/Widgets/input_password_wigdet.dart';
import 'package:flutter_getx_mvvm_mvc/view/login/Widgets/login_button_widget.dart';
import 'package:get/get.dart';
import '../../view_model/controller/login/login_view_controller.dart';










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


                 InputEmailWidget(),   //* <-- Call This InputEmailWidget


                  const SizedBox(
                    height: 20,
                  ),


                  InputPasswordWidget()   //* <-- Call This InputPasswordWidget



                ],
              ),
            ),


            const SizedBox(
              height: 40,
            ),

            LoginButtonWidget(formkey: _formkey,)    //* <-- Call This LoginButtonWidget
           


          ],
        ),
      ),
    );
  }
}
