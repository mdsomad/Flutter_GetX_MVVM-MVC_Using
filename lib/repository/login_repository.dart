

import 'package:flutter_getx_mvvm_mvc/data/network/network_api_services.dart';
import 'package:flutter_getx_mvvm_mvc/res/app_url/app_url.dart';

class LoginRepository {

  final _apiService = NetworkApiServices();      //* <-- This NetworkApiServices class Create Instance & Object
  
  //TODO loginApi Function
  Future<dynamic> loginApi(var data)async{
    dynamic response  = _apiService.postApi(data,AppUrl.loginApi);
    return response;
  }


}