# flutter_getx_mvvm_mvc

<!-- - [Supported languages country codes website link Click Now](https://api.flutter.dev/flutter/flutter_localizations/GlobalMaterialLocalizations-class.html) -->


A new Flutter project.
- 1: Use Fonts & Images





## Image || Fonts Use Ui Preview


<table>
  
  
<tr>                    
   <th>Splash Screen View</th>
</tr>  
  
  
  
<tr>

<td>
  <img src="https://github.com/mdsomad/Flutter_GetX_MVVM-MVC_Using/assets/103892160/6e7a00c1-d2f8-47ea-8f57-f0a6d1925aeb" alt="Splash Screen View Example" width="260"/>
</td>


  
</tr>

</table>








First, create Assets Folder then create image folder then create Fonts folder then create icons folder then add images || fonts || iconsimages 


- 1: TODO Create ImageAssets class   (Using This code)
```sh

class ImageAssets{

  static const String splashScreen = "assets/images/cart.jpg";
  static const String messageIcon = "assets/icons/message.svg";
  
}

```





- 2: TODO Create AppFonts Class
```sh
class AppFonts {
  static const String robotBold = "Roboto-Regular";
  static const String dancingScript = "DancingScript";
}

```








- 2: pubspec.yaml file configure fonts this code
```sh
fonts:
    - family: DancingScript
      fonts:
        - asset: assets/fonts/DancingScript-VariableFont_wght.ttf
    - family: Roboto-Regular
      fonts:
        - asset: assets/fonts/Roboto-Regular.ttf

```





