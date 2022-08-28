import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tracker_admin_panel/routs/app_routs.dart';
import 'package:tracker_admin_panel/routs/app_screens.dart';
import 'package:tracker_admin_panel/screens/login_screen.dart';
import 'package:tracker_admin_panel/services/fetch_data_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tracker_admin_panel/utilities/%20translation/trans.dart';
import 'componant/chart.dart';
import 'componant/custom_container.dart';
import 'componant/left_drawer.dart';
import 'utilities/constant.dart';
import 'controller/dashboard_controller.dart';
import 'helper/cache_helper.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);
final fireCloud = FirebaseFirestore.instance;

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAGsTls7_ngLVr8zQixAU0ZLncaQezy8gs",
      appId: "com.example.tracker_admin_panel",
      messagingSenderId: "XXX",
      projectId: "tracker-f3876",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    VisualDensity.adaptivePlatformDensity;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MediaQuery(
      data: const MediaQueryData(),
      child: ScreenUtilInit(
        designSize: const Size(428, 926),
        builder: (BuildContext, Widget) {
       final lang=   CacheHelper.getData(key: 'currentlanguage');
         return GetMaterialApp(
           translations: Translation(),
          locale: Locale(lang!=null?lang :'en'),
          // your main lang
          fallbackLocale: Locale('en'),
          //in case an error occurs in any lang file eng will be the default
          debugShowCheckedModeBanner: false,
          home: MyWidget(),
          // home: PerformanceScreen(),
          // initialRoute: AppRouts.loginScreen,
          // getPages: AppScreens.screens,
        );}
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget>
    with SingleTickerProviderStateMixin {
  double _size = 0.0;
  bool _large = false;

  final controller = DashoardController();
  var  selectedValue ;
  void _updateSize() {
    setState(() {
      _large = !_large;
      _size = _large ? 200.0 : 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          AnimatedSize(
              curve: Curves.easeIn,
              vsync: this,
              duration: Duration(seconds: 1),
              child: LeftDrawer(
                size: _size,
              )),
          Expanded(
              flex: 4,
              child: Container(
                child: Column(children: [
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(8),
                    child: Wrap(
                      children: [
                        IconButton(
                          icon: Icon(Icons.menu, color: Colors.black87),
                          onPressed: () {
                            _updateSize();
                          },
                        ),
                        FlatButton(
                          child:   Text(
                            'Dashboard'.tr,
                            style: TextStyle(color: Colors.black87),
                          ),
                          onPressed: () {},
                        ),
                        FlatButton(
                          child:   Text(
                            'User'.tr,
                            style: TextStyle(color: Colors.black87),
                          ),
                          onPressed: () {},
                        ),
                        FlatButton(
                          child:   Text(
                            'Settings'.tr,
                            style: TextStyle(color: Colors.black87),
                          ),
                          onPressed: () async {
                            final services = FetchDataServices();

                            await controller.getShipments();
                          },
                        ),
                        const Spacer(),
                        DropdownButton(
                            items:     [
                              DropdownMenuItem(
                                child: Text('en'.tr),
                                value:'en',
                              ),
                              DropdownMenuItem(
                                child: Text('ar'.tr),
                                value:'ar',
                              ),
                            ],
                            value: selectedValue,
                             onChanged: (value) {
                              setState(() {
                                selectedValue=value;
                              });
                              Get.updateLocale(Locale(selectedValue));
                              CacheHelper.saveData(key: 'currentlanguage', value: selectedValue);
                            }),
                        IconButton(
                          icon: const Icon(Icons.notification_important,
                              color: Colors.black87),
                          onPressed: () {},
                        ),
                        const CircleAvatar(),
                      ],
                    ),
                  ),
                  Container(
                    height: 1,
                    color: Colors.black12,
                  ),
                  Card(
                    margin: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    child: Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        children:[
                          Text(
                            'Home / Admin / Dashboard'.tr,
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: ListView(children: [
                      GetBuilder<DashoardController>(
                        init: DashoardController(),
                        builder: (controller) => Row(
                          children: [
                            //users info
                            CustomContainer(
                              index: 0,
                              numberOfUsers: controller.lista.length,
                            ),
                            //users auth
                            CustomContainer(
                                index: 1,
                                numberOfUsers: controller.listOfUsers.length),
                            CustomContainer(
                              index: 2,
                              numberOfUsers: controller.listOfShipments.length,
                            ),
                          ],
                        ),
                      ),
                      getBody(),
                      Container(
                        height: 400,
                        color: Color(0xFFE7E7E7),
                        padding: const EdgeInsets.all(16),
                        child: GetBuilder<DashoardController>(
                          init: DashoardController(),
                          builder: (controller) => controller.isLoading == false
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: K.mainColor,
                                  ),
                                )
                              : ListView.builder(
                                  itemCount: controller.lista.isEmpty
                                      ? 0
                                      : controller.lista.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    var numberOfTheListTile = index + 1;
                                    return ListTile(
                                        leading: Text(
                                            numberOfTheListTile.toString()),
                                        trailing: Text(
                                          controller.lista[index].timestamp
                                              .toString(),
                                          style: const TextStyle(
                                              color: Colors.green,
                                              fontSize: 15),
                                        ),
                                        title: Text(
                                            "${controller.lista[index].profileName}"));
                                  }),
                        ),
                      ),
                    ]),
                  ),
                ]),
              ))
        ],
      ),
    );
  }

}
