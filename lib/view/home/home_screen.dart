import 'package:flutter/material.dart';
import 'package:flutter_getx_mvvm_mvc/res/Routes/routes_name.dart';
import 'package:get/get.dart';
import '../../view_model/controller/user_preference/user_preference_view_model.dart';




class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

UserPreference userPreference = UserPreference();   //* <-- This UserPreference class Create Instance &  Object


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Home Screen"),
          actions: [
            IconButton(onPressed: (){
               //* Call This removeUser function
              userPreference.removeUser().then((value){    
                  Get.toNamed(RouteName.loginView);
              });   

            }, icon:Icon(Icons.logout))
          ],
        ),
    );
  }
}