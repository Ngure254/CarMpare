import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:car_list/controllers/all.dart';
import 'package:car_list/views/preload/splash_screen.dart';

import 'package:car_list/helpers/theme.helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(VehicleController());
  Get.put(NavController());
  Get.put(AppController());
  Get.put(ThemeController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Car Books',
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightThemeData,
      darkTheme: AppThemes.lightThemeData,
      home: const SplashScreen(),
    );
  }
}
