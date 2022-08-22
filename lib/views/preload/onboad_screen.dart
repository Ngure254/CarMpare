import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_overboard/flutter_overboard.dart';
import '../auth/signup_screen.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OverBoard(
        pages: pages,
        showBullets: true,
        skipCallback: () {
          Get.to(const SignupScreen());
        },
        finishCallback: () {
          Get.to(const SignupScreen());
        },
      ),
    );
  }
}

final pages = [
  PageModel(
      color: Colors.black,
      imageAssetPath: 'assets/icons/logo2.png',
      title: 'Screen 1',
      body: 'Share your ideas with the team',
      doAnimateImage: true),
  PageModel(
      color: Colors.blue,
      imageAssetPath: 'assets/icons/logo2.png',
      title: 'Screen 2',
      body: 'See the increase in productivity & output',
      doAnimateImage: true),
  PageModel(
      color: Colors.green,
      imageAssetPath: 'assets/icons/logo2.png',
      title: 'Screen 3',
      body: 'Connect with the people from different places',
      doAnimateImage: true),
];
