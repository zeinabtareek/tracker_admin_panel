import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
 import 'package:get/get.dart';
import 'package:tracker_admin_panel/routs/app_routs.dart';
import '../../../helper/cache_helper.dart';
import '../main.dart';
import '../services/auth_services.dart';


class RegisterController extends GetxController {
  final services = RegisterServices();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  var listOfUsers=[];

  login(){
    services.signInAnonymously().then((value) {
      Get.offAllNamed(AppRouts.dashBoard);
      listOfUsers.add(value);
    });
  }
  logout(){
    services.signOut();

  }
/************/



}