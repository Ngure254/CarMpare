import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:car_list/widgets/buttons/all.dart';
import 'package:car_list/widgets/inputs/all.dart';
import 'package:car_list/widgets/separator/orline.dart';
import 'package:car_list/helpers/color.helper.dart';

// ignore: must_be_immutable
class ForgotScreen extends StatelessWidget {
  static const routeName = '/forgort';

  const ForgotScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              const Spacer(),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Forgot Password",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Enter your email below and we will send you instructions on how to change your password.",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const InputField(
                  hint: "enter email",
                  inputType: TextInputType.emailAddress),
              const SizedBox(
                height: 20,
              ),
              const Orline(),
              const SizedBox(
                height: 10,
              ),
              TxtButton(
                label: "SEND",
                backgroundColor: ColorsData.Primary,
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
