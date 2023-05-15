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