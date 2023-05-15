import 'package:get/get.dart';

class Languages extends Translations{


  //TODO Map
  @override
   Map<String,Map<String,String>> get keys =>{
  
    'en_Us':{                                    //* <-- Add multiple languages
      "splash_screen":"Splash Screen",
      'internet_exception' : "We're unable tp show results.\nPtease check your\ninternet conenction.",
      'general_exception': "We're unable to process your request.\n Please try again",
      'welcome_back':"Welcome\nBack",
      'login':"Login",
      'email_hint':"Email",
      'password_hint':"Password",
    },

    'hi_IN':{
      "splash_screen":"स्प्लैश स्क्रीन",
      'internet_exception' : "हम परिणाम दिखाने में असमर्थ हैं।\nकृपया अपनी जाँच करें\nइंटरनेट कनेक्शन.",
      'general_exception': "हम आपके अनुरोध को संसाधित करने में असमर्थ हैं।\n कृपया पुन: प्रयास करें",
      'login':"लॉग इन करें",
      'email_hint':"ईमेल",
      'password_hint':"पासवर्ड",
    }
    
     
   };
}