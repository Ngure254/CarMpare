import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:car_list/widgets/buttons/all.dart';
import 'package:car_list/widgets/inputs/all.dart';
import 'package:car_list/widgets/separator/orline.dart';
import 'package:car_list/helpers/color.helper.dart';
import '../../widgets/navbar.dart';

import 'signup_screen.dart';

// ignore: must_be_immutable
class SigninScreen extends StatelessWidget {
  static const routeName = '/signin';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    OutlinedBtn(
                      label: 'SIGN UP',
                      size: 100,
                      Page: const SignupScreen(),
                      textColor: ColorsData.DarkBg,
                      boderColor: ColorsData.DarkBg,
                    ),
                  ],
                ),
                const Spacer(),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Nice to see you again, please ",
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 14, color: ColorsData.text),
                  ),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Login to",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: ColorsData.DarkBg),
                  ),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Your Account",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: ColorsData.DarkBg),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const InputField(
                    hint: "Enter  email",
                    inputType: TextInputType.emailAddress),
                const SizedBox(
                  height: 10,
                ),
                const InputField(
                    hint: "Password", inputType: TextInputType.text),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Forgot password?",
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(
                  height: 20,
                ),
                TxtButton(
                  label: "SIGN IN",
                  backgroundColor: ColorsData.Primary,
                  Page: NavScreen(),
                  force: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
