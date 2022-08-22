import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:car_list/widgets/buttons/all.dart';
import 'package:car_list/widgets/inputs/all.dart';
import 'package:car_list/widgets/separator/orline.dart';
import 'package:car_list/helpers/color.helper.dart';

import 'signin_screen.dart';

// ignore: must_be_immutable
class SignupScreen extends StatelessWidget {
  static const routeName = '/signup';

  const SignupScreen({Key? key}) : super(key: key);

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
                      label: 'SIGN IN',
                      Page: SigninScreen(),
                      size: 100,
                      textColor: ColorsData.DarkBg,
                      boderColor: ColorsData.DarkBg,
                    ),
                  ],
                ),
                const Spacer(),
                
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Welcome Up to the ",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 16,
                      color:ColorsData.text 
                    ),
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Best Car Listing ",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: ColorsData.DarkBg
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Services",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: ColorsData.DarkBg
                    ),
                  ),
                ),
                
                const SizedBox(
                  height: 30,
                ),
                const InputField(
                    hint: "Enter  email", inputType: TextInputType.emailAddress),
                const SizedBox(
                  height: 10,
                ),
                const InputField(
                    hint: "Password", inputType: TextInputType.visiblePassword),
                const SizedBox(
                  height: 20,
                ),
                const InputField(
                    hint: "Confirm password",
                    inputType: TextInputType.visiblePassword),
                const SizedBox(
                  height: 20,
                ),
                TxtButton(
                  label: "SIGN UP",
                  backgroundColor: ColorsData.Primary,
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
