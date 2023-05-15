import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../models/login/UserModel.dart';





class UserPreference {


//TODO Create saveUser function
Future<bool> saveUser(UserModel responseModel)async{
   SharedPreferences sp = await SharedPreferences.getInstance();
   sp.setString("token", responseModel.token.toString());
   sp.setBool("isLogin", responseModel.isLogin!);
   
    return true;

  }



//TODO Create getUser function
Future<UserModel> getUser()async{
   SharedPreferences sp = await SharedPreferences.getInstance();
   String? token = sp.getString("token");
   bool? isLogin = sp.getBool("isLogin");
   
    return UserModel(
      token:token,
      isLogin:isLogin
    );
  }






//TODO Create removeUser function
Future<bool> removeUser()async{
   SharedPreferences sp = await SharedPreferences.getInstance();
   sp.clear();
   return true;
}
  
  
  
  
  
  
  
   
}






   
