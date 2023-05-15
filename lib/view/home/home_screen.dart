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
              return InternetEexceptionWidget(onPress: () {      //* <-- Call This InternetEexceptionWidget
                homeController.refreshApi();
              });
            }else{

              return GeneralEexceptionWidget(onPress: () {     //* <-- Call This GeneralEexceptionWidget
                homeController.refreshApi();    //* <-- Call This refreshApi Function
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
                      backgroundImage: NetworkImage(homeController.userList.value.data![index].avatar.toString()),
                    ),
                    title: Text(homeController.userList.value.data![index].firstName.toString()),
                    subtitle: Text(homeController.userList.value.data![index].email.toString()),
                  ), //ListTile
                );  // Card
              },
            ); // ListView.builder
        }



      }
    ), // Obx





    );

  }
}
