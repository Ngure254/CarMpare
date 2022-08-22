import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:car_list/helpers/color.helper.dart';

import 'presighup_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3)).then((_) {
      Get.off( const PreSignupScreen());
    });
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                
                image:const DecorationImage(image: AssetImage('assets/icons/logo2.png')),
                shape: BoxShape.circle,
                border: Border.all( color: ColorsData.Primary),
              ),
            ),
            
            const Spacer(),
            const Text(
              "Powered by",
              style: TextStyle(
                fontSize: 14,
                color: ColorsData.Primary,
              ),
            ),
            const Text(
              "Patner Company Name",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
