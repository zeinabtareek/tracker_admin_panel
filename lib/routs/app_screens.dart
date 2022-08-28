import 'package:get/get.dart';
import 'package:tracker_admin_panel/model/dashboard_model.dart';
import 'package:tracker_admin_panel/routs/app_routs.dart';

import '../main.dart';
import '../screens/login_screen.dart';

class AppScreens{
  static final screens=[
    GetPage(name: AppRouts.loginScreen ,page: ()=>LoginScreen()),
    GetPage(name :AppRouts.dashBoard,page:()=>MyWidget()),
  ];
}