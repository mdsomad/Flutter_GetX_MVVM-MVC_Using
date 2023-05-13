# flutter_getx_mvvm_mvc

A new Flutter project.
<!-- - 1: Network Services Api



- 1: TODO Create abstract class BaseApiServices
```sh
abstract class BaseApiServices {
  Future<dynamic> getApi(String url);
  Future<dynamic> postApi(dynamic data, String url);
}
```





- 2: TODO Create NetworkApiServices class     ( inherit this --> BaseApiServices class)
```sh
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_getx_mvvm_mvc/data/app_exceptions.dart';
import 'package:flutter_getx_mvvm_mvc/data/network/base_api_services%20.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;






class NetworkApiServices extends BaseApiServices{



  @override
  Future<dynamic> getApi(String url)  async{
    // TODO: implement getApi

    if(kDebugMode){
      print(url);
    }
    
    dynamic responseJson;
    try {
       final response = await http.get(Uri.parse(url)).timeout( const Duration(seconds: 60));

       responseJson = returnResponse(response);   //* <-- Call this returnResponse  Function

    } on SocketException{
      throw InternetException('');
    }on RequestTimeOutException{
      throw RequestTimeOutException('');
    }

    return responseJson;
    
  }






  @override
  Future<dynamic> postApi(var data, String url)  async{
    // TODO: implement getApi
    
    if(kDebugMode){
      print(url);
      print(data);
    }
    
    
    dynamic responseJson;
    try {
       final response = await http.post(Uri.parse(url),

          body: jsonEncode(data)    //* <-- Agar row form mein Data Hai To Aise Hi bhejna hai
         // body: data              //* <-- Agar from-data hai to Aise Hi bhejna hai  
                
       ).timeout( const Duration(seconds: 60));

       responseJson = returnResponse(response); //* <-- Call this returnResponse  Function

    } on SocketException{
      throw InternetException('');
    }on RequestTimeOutException{
      throw RequestTimeOutException('');
    }

    return responseJson;
    
  }






// TODO Create returnResponse Function
 dynamic returnResponse(http.Response response){

   switch (response.statusCode) {
     case 200:
      dynamic responseJson = jsonDecode(response.body);
      return responseJson;
     case 400:
      throw InvalidUrlException;
     default:
      throw FetchDataException("Error accoured while communicating with server"+response.statusCode.toString());
   }
  
 }



  

}

``` -->