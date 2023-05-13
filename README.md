# flutter_getx_mvvm_mvc

<!-- - [Supported languages country codes website link Click Now](https://api.flutter.dev/flutter/flutter_localizations/GlobalMaterialLocalizations-class.html) -->


A new Flutter project.
- 1: Components Craete





## Components Ui Preview


<table>
  
  
<tr>                    
   <th>Internet Eexception Component language English View</th>
   <th>Internet Eexception Component language Hindi View</th>
   <th>General Eexception Component language English View</th>
   <th>General Eexception Component language Hindi View</th>
   <th>Round Button Component View</th>
</tr>  
  
  
  
<tr>

<td>
  <img src=" " alt="Round Button Component view Example" width="260"/>
</td>




<td>
  <img src=" " alt="Internet Eexception Component language English view Example" width="260"/>
</td>
<td>
  <img src=" " alt="Internet Eexception Component language Hindi view Example" width="260"/>
</td>


<td>
  <img src=" " alt="General Eexception Component language English view Example" width="260"/>
</td>
<td>
  <img src=" " alt="General Eexception Component language Hindi view Example" width="260"/>
</td>




  
</tr>

</table>








- 1: Round Button Component code 
```sh
import 'package:flutter/material.dart';
import 'package:flutter_getx_mvvm_mvc/res/Colors/app_colors.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';



class GeneralEexceptionWidget extends StatefulWidget {
  final VoidCallback onPress;
  const GeneralEexceptionWidget({super.key, required this.onPress});

  @override
  State<GeneralEexceptionWidget> createState() =>
      _GeneralEexceptionWidgetState();
}

class _GeneralEexceptionWidgetState extends State<GeneralEexceptionWidget> {
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
            Icons.cloud_off,
            color: AppColor.redColor,
            size: 50,
          ),


          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Center(
                child: Text(
              'general_exception'.tr,
              textAlign: TextAlign.center,
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








- 2: Internet Eexception Component code 
```sh

import 'package:flutter/material.dart';
import 'package:flutter_getx_mvvm_mvc/res/Colors/app_colors.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';





class InternetEexceptionWidget extends StatefulWidget {
  final VoidCallback onPress;
  const InternetEexceptionWidget({super.key, required this.onPress});

  @override
  State<InternetEexceptionWidget> createState() =>
      _InternetEexceptionWidgetState();
}

class _InternetEexceptionWidgetState extends State<InternetEexceptionWidget> {
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
            Icons.cloud_off,
            color: AppColor.redColor,
            size: 50,
          ),


          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Center(
                child: Text(
              'internet_exception'.tr,
              textAlign: TextAlign.center,
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





- 3: General Etexception Component code
```sh
import 'package:flutter/material.dart';
import 'package:flutter_getx_mvvm_mvc/res/Colors/app_colors.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';




class GeneralEexceptionWidget extends StatefulWidget {
  final VoidCallback onPress;
  const GeneralEexceptionWidget({super.key, required this.onPress});

  @override
  State<GeneralEexceptionWidget> createState() =>
      _GeneralEexceptionWidgetState();
}

class _GeneralEexceptionWidgetState extends State<GeneralEexceptionWidget> {
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
            Icons.cloud_off,
            color: AppColor.redColor,
            size: 50,
          ),


          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Center(
                child: Text(
              'general_exception'.tr,
              textAlign: TextAlign.center,
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












- 4: AppColor class code 
```sh
import 'package:flutter/material.dart';

class AppColor{

  static const Color blackColor = Color(0xf000000);
  static const Color whiteColor = Color(0xffffffff);

  static const Color primaryColor = Color(0xff01B1C9);
  static const Color primaryButtonColor = Color(0xff01B1C9);
  static const Color secondaryButtonColor = Color(0xffFC3F5B);
  static const Color redColor = Color(0xffFC3F5B);
  static const Color primaryTextColor = Color(0xff000000);
  static const Color secondaryTextColor = Color(0xff444648);
  
}
```




- 5: Languages class code 
```sh
import 'package:get/get.dart';


class Languages extends Translations{

  //TODO Map
  @override
   Map<String,Map<String,String>> get keys =>{
  
    'en_Us':{                                    //* <-- Add multiple languages
      "splash_screen":"Splash Screen",
      'internet_exception' : "We're unable tp show results.\nPtease check your\ninternet conenction.",
      'general_exception': "We're unable to process your request.\n Please try again"
    },

    'hi_IN':{
      "splash_screen":"स्प्लैश स्क्रीन",
      'internet_exception' : "हम परिणाम दिखाने में असमर्थ हैं।\nकृपया अपनी जाँच करें\nइंटरनेट कनेक्शन.",
      'general_exception': "हम आपके अनुरोध को संसाधित करने में असमर्थ हैं।\n कृपया पुन: प्रयास करें"
    }
    
     
   };


   
}

```







