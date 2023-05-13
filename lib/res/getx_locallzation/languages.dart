import 'package:get/get.dart';

class Languages extends Translations{





  //TODO Map
  @override
   Map<String,Map<String,String>> get keys =>{
  
    'en_Us':{                                    //* <-- Add multiple languages
      "splash_screen":"Splash Screen"
    },

    'hi_IN':{
      "splash_screen":"स्प्लैश स्क्रीन",
    }
    
     
   };
}