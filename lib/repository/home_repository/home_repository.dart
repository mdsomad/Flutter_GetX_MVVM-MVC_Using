
import 'package:flutter_getx_mvvm_mvc/data/network/network_api_services.dart';
import 'package:flutter_getx_mvvm_mvc/models/home/user_list_model.dart';
import 'package:flutter_getx_mvvm_mvc/models/login/UserModel.dart';
import 'package:flutter_getx_mvvm_mvc/res/app_url/app_url.dart';



class HomeRepository {

  final _apiService = NetworkApiServices();     //* <-- This NetworkApiServices class Create Instance & Object
  
  //TODO Create userListApi Function
  Future<UserListModel> userListApi()async{
    dynamic response  = await _apiService.getApi(AppUrl.userListApi);
    return UserListModel.fromJson(response);
  }


}