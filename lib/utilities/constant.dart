import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class K {
  static const mainColor = Color(0xFFfc6c6a);
  static const grayColor = Color(0xFF999999);
  static const blackColor = Color(0xFF222222);
  static const borderColor = Color(0xFFF0E5CF);
  static const cardColor = Color(0xFF082032);
  static const whiteColor = Colors.white;
  static const redColor = Color(0xfffd0503);
  static final width = Get.width;
  static final height = Get.height;
  static const colors = <Color>[Colors.indigo, Colors.blue, Colors.orange, Colors.red];

  static SizedBox sizedBoxH = SizedBox(
    height: 15.h,
  );
  static SizedBox sizedBoxW = SizedBox(
    width: 22.w,
  );
  static const List<Color> colorList = [
    K.whiteColor,
    K.blackColor,
    Colors.purpleAccent,
    K.grayColor,
  ];
  static int MobileBreakpoint = 576;
  static int TabletBreakpoint = 1024;
  static int DesktopBreakPoint = 1366;
  static const textStyleAlert = TextStyle(
      fontSize: 18.0,
      decoration: TextDecoration.none,
      decorationStyle: TextDecorationStyle.dashed,
      decorationColor: Color(0x00ffffff));
  static BoxDecoration TextFieldboxDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(10.0),
    color: K.whiteColor,
    border: Border.all(
        color: K.whiteColor,
        style: BorderStyle.solid,
        width: 2),
  );


}
