# flutter_getx_mvvm_mvc

- [Supported languages country codes website link Click Now](https://api.flutter.dev/flutter/flutter_localizations/GlobalMaterialLocalizations-class.html)
- [Free Test & Practice API Link Check Now Http request & Api Hite A](https://reqres.in)

A new Flutter project.
- 1:How to Get API Http Request with GetX 





## Get API Rresponse Ui Preview


<table>
  
  
<tr> 
   <th>Data Display Screen View</th>
   <th>No Internet Error Screen View</th>
   <th>Other Error Screen View</th>
   <th>Server Response Error Message View</th>
</tr>  
  
  
  
<tr>


<td>
  <img src="https://github.com/mdsomad/Flutter_GetX_MVVM-MVC_Using/assets/103892160/323fab3c-ca2f-4637-8108-6dd35756f21b" alt="Data Display Screen View Example" width="260"/>
</td>
  
  
<td>
  <img src="https://github.com/mdsomad/Flutter_GetX_MVVM-MVC_Using/assets/103892160/5613ca14-e141-48c7-a2af-1a2c6a239e6f" alt="No Internet Error Screen View Example" width="260"/>
</td>

<td>
  <img src="https://github.com/mdsomad/Flutter_GetX_MVVM-MVC_Using/assets/103892160/aa7049e8-afe7-46cd-90f5-b142edfde270" alt="Other Error Screen View Example" width="260"/>
</td>

<td>
  <img src="https://github.com/mdsomad/Flutter_GetX_MVVM-MVC_Using/assets/103892160/dffb9eb3-f495-47b5-9468-e90192770189" alt="Server Response Error Message View Example" width="260"/>
</td>



  
</tr>

</table>







- 1: TODO Create UserListModel Class code
```sh
class UserListModel {
  int? page;
  //String? perPage;      //* <-- Data type Error Show This --> type 'int' is not a subtype of type 'String?'
  int? perPage;
  int? total;
  int? totalPages;
  List<Data>? data;
  Support? support;

  UserListModel(
      {this.page,
      this.perPage,
      this.total,
      this.totalPages,
      this.data,
      this.support});

  UserListModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    perPage = json['per_page'];
    total = json['total'];
    totalPages = json['total_pages'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    support =
        json['support'] != null ? new Support.fromJson(json['support']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['per_page'] = this.perPage;
    data['total'] = this.total;
    data['total_pages'] = this.totalPages;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.support != null) {
      data['support'] = this.support!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  Data({this.id, this.email, this.firstName, this.lastName, this.avatar});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['avatar'] = this.avatar;
    return data;
  }
}

class Support {
  String? url;
  String? text;

  Support({this.url, this.text});

  Support.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['text'] = this.text;
    return data;
  }
}


```














- 2: TODO Create HomeRepository class
```sh


import 'package:flutter_getx_mvvm_mvc/data/network/network_api_services.dart';
import 'package:flutter_getx_mvvm_mvc/models/home/user_list_model.dart';
import 'package:flutter_getx_mvvm_mvc/models/login/UserModel.dart';
import 'package:flutter_getx_mvvm_mvc/res/app_url/app_url.dart';



class HomeRepository {

  final _apiService = NetworkApiServices();  //* <-- This NetworkApiServices class Create Instance & Object
  
  //TODO Create userListApi Function
  Future<UserListModel> userListApi()async{      
    dynamic response  = await _apiService.getApi(AppUrl.userListApi);
    return UserListModel.fromJson(response);
  }


}



```














- 3: TODO Create HomeController class this code
```sh
import 'package:flutter/foundation.dart';
import 'package:flutter_getx_mvvm_mvc/data/response/status.dart';
import 'package:flutter_getx_mvvm_mvc/models/home/user_list_model.dart';
import 'package:flutter_getx_mvvm_mvc/repository/home_repository/home_repository.dart';
import 'package:get/get.dart';






class HomeController extends GetxController{

  final _api = HomeRepository();  //* <-- This HomeRepository class Create Instance & Object
  
  //TODO Create variables
  final rxRequestStatus = Status.LOADING.obs;   //* <-- Set By default value LOADING
  final userList = UserListModel().obs;
  final error = ''.obs;
  

  //TODO Create Set Values Functions
  void setRxRequestStatus(Status _value)=> rxRequestStatus.value = _value;
  void setUserList(UserListModel _value)=> userList.value = _value;
  void setError(String _value)=> error.value = _value;


  //* Aap isko aise bhi likh sakte hain
  // void setUserList(UserListModel _value){  
  //       userList.value =_value;
  // } 




  //TODO Create userListApi Function
  void useListApi(){

    _api.userListApi().then((value){

       setRxRequestStatus(Status.COMPLETED);   //* <-- This setRxRequestStatus Function call
       setUserList(value);                     //* <-- This setUserList Function call then Add Data

    }).onError((error, stackTrace){

       if(kDebugMode){
         print("Error Value This --> $error");
         print('StackTrace Error Value --> $stackTrace');
       }

       setError(error.toString());         //* <-- This setError Function call then Add Error Data
       setRxRequestStatus(Status.ERROR);   //* <-- This setRxRequestStatus Function call
   
    });
  }






  //TODO Create refreshApi Function
  void refreshApi(){

      setRxRequestStatus(Status.LOADING);


    _api.userListApi().then((value){

       setRxRequestStatus(Status.COMPLETED);   //* <-- This setRxRequestStatus Function call
       setUserList(value);                     //* <-- This setUserList Function call then Add Data

    }).onError((error, stackTrace){
      
       if(kDebugMode){
         print("Error Value This --> $error");
         print('StackTrace Error Value --> $stackTrace');
       }

       setError(error.toString());         //* <-- This setError Function call then Add Error Data
       setRxRequestStatus(Status.ERROR);   //* <-- This setRxRequestStatus Function call

   
    });
  }
  
  
     
}




```










- 4: HomeScreen Api Data Display code
```sh
import 'package:flutter/material.dart';
import 'package:flutter_getx_mvvm_mvc/data/response/status.dart';
import 'package:flutter_getx_mvvm_mvc/res/Components/general_exception.dart';
import 'package:flutter_getx_mvvm_mvc/res/Components/internet_exceptions_widget.dart';
import 'package:flutter_getx_mvvm_mvc/res/Routes/routes_name.dart';
import 'package:flutter_getx_mvvm_mvc/view_model/controller/home/home_view_controller.dart';
import 'package:get/get.dart';
import '../../res/Components/show_error_message_eexception_widget.dart';
import '../../view_model/controller/user_preference/user_preference_view_model.dart';




class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  final homeController = Get.put(HomeController()); //* <-- This HomeController GetX class Create Instance & Object

  UserPreference userPreference = UserPreference(); //* <-- This UserPreference class Create Instance &  Object

  @override
  void initState() {
    // TODO: implement initState
    homeController.useListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Home Screen"),
        actions: [
          IconButton(
              onPressed: () {
                //* Call This removeUser function
                userPreference.removeUser().then((value) {
                  Get.toNamed(RouteName.loginView);
                });
              },
              icon: Icon(Icons.logout))
        ],
      ),



      body: Obx(() {
    
        switch (homeController.rxRequestStatus.value) {
          case Status.LOADING:

            return const Center(child: CircularProgressIndicator());

          case Status.ERROR:

            if (homeController.error.toString() == "No internet") {
              return InternetEexceptionWidget(onPress: () {    //* <-- Call This Widget 
                homeController.refreshApi();    //* <-- Call This refreshApi Function
              });
            }else{

              return GeneralEexceptionWidget(onPress: () {    //* <-- Call This Widget
                homeController.refreshApi();     //* <-- Call This refreshApi Function
              });

              //! Currently not use Text Widget
              //! return Center(child: Text(homeController.error.toString()));

            }

          case Status.COMPLETED:

            return ListView.builder(
              itemCount: homeController.userList.value.data!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(homeController.userList.value.data![index].avatar
                      .toString()),
                    ),
                    title: Text(homeController.userList.value.data![index].firstName.toString()),
                    subtitle: Text(homeController.userList.value.data![index].email.toString()),
                  ), //ListTile
                );  // Card
              },
            ); // ListView.builder
        }



      }
    ), // Obx End





    );

  }
}





```









- 5: TODO Create ShowErrorMessageEexceptionWidget code
```sh
import 'package:flutter/material.dart';
import 'package:flutter_getx_mvvm_mvc/res/Colors/app_colors.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';





class ShowErrorMessageEexceptionWidget extends StatefulWidget {
  final VoidCallback onPress;
  final String errorMessage;
  const ShowErrorMessageEexceptionWidget({super.key, required this.onPress, required this.errorMessage});

  @override
  State<ShowErrorMessageEexceptionWidget> createState() =>
      _ShowErrorMessageEexceptionWidgetState();
}

class _ShowErrorMessageEexceptionWidgetState extends State<ShowErrorMessageEexceptionWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          SizedBox(
            height: height * .15,
          ),


          Icon(
            Icons.error,
            color: AppColor.redColor,
            size: 50,
          ),


          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Center(
                child: Text(
              widget.errorMessage,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20,color: Colors.red,fontWeight: FontWeight.w400),
            )),
          ),


          SizedBox(
            height: height * .15,
          ),




          InkWell(
            onTap: widget.onPress,
            child: Container(
              height: 44,
              width: 160,
              decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.circular(50)),
              child: Center(
                  child: Text("Retry",
                  style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.white),
              )),
            ),
          )





        ],
      ),
    );





    
  }
}



```









## Starting LoginScreen codes
- 6: TODO Create LoginView code
```sh

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



```









- 7: TODO Create InputEmailWidget code
```sh
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



```














- 8: TODO Create InputPasswordWidget code
```sh
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




```





- 9: TODO Create LoginButtonWidget code
```sh
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




```







