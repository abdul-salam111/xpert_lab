import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:xpert_lab/app/firebaseServices/notificationServices.dart';
import 'app/appConst/index.dart';
import 'app/routes/app_pages.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  NotificationServices().initLocalNotifications();
  runApp(ScreenUtilInit(
    designSize: const Size(360, 690),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context, child) {
      return GetMaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: whiteColor,
        ),
        debugShowCheckedModeBanner: false,
        title: appTitle,
        initialRoute: Routes.SPLASH_SCREEN,
        getPages: AppPages.routes,
      );
    },
  ));
}
