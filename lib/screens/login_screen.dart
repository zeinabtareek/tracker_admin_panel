import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../componant/buttons_product_screen.dart';

import '../utilities/constant.dart';
import '../controller/auth_controller.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width/20.w,
          vertical: MediaQuery.of(context).size.height/10.h,
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bk.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: GetBuilder<RegisterController>(
          init: RegisterController(),
          builder: (controller) => Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.center,
                children: [
                  Text(
                    'Hello Again !',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  K.sizedBoxH,
                  SizedBox(
                    width: K.width,
                    child: Text(
                      '\nwelcome back to your second home!',
                      style: TextStyle(
                        fontSize: 12.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  K.sizedBoxH,
                  K.sizedBoxH,

                  Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "Recovery Password?",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: K.blackColor,
                          fontFamily: "Poppins SemiBold",
                        ),
                      ),
                    ),
                  ),
                  K.sizedBoxH,
                  Container(
                    width: double.infinity,
                    height: 80.h,
                    child: Buttons(
                      onTap: () {
                        controller.login();
                        // print(controller.emailController.value);
                      },
                      label: 'Log In',
                      color: K.mainColor,
                      height: 41,
                      textColor: K.whiteColor,
                    ),
                  ),

                ]),
          ),
        ),

    );
  }
}
