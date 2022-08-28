import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../controller/auth_controller.dart';
import '../controller/dashboard_controller.dart';


class Binding extends Bindings {
  @override
  void dependencies (){
     // Get.lazyPut(() => HomeController());
     // Get.lazyPut(() => StartShipmentDataController());
     Get.lazyPut(() => DashoardController());
     Get.lazyPut(() => RegisterController());
     // Get.lazyPut(() => MapController());
  }
}