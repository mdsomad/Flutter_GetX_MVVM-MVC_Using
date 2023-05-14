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

           Obx(() =>  RoundButton(      //* <-- Call RoundButton
                white: 200,
                title: 'login'.tr,
                loading: loginViewController.loading.value,
                onPress: () {
                  if (_formkey.currentState!.validate()) {
                     loginViewController.loginApi();
                  }
                })
          )
           


          ],
        ),
      ),
    );
  }
}
