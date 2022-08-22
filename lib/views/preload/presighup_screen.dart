import 'package:flutter/material.dart';
import '../auth/signin_screen.dart';

import 'package:car_list/widgets/buttons/all.dart';
import 'package:car_list/helpers/color.helper.dart';

class PreSignupScreen extends StatelessWidget {
  const PreSignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Hero(
        tag: "image",
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
                alignment: Alignment.center,
                image: AssetImage('assets/images/benz.png'),
                fit: BoxFit.cover),
          ),
        ),
      ),
      Hero(
        tag: "gradident",
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Colors.black.withOpacity(0.1),
                Colors.black.withOpacity(0.3),
                Colors.black.withOpacity(0.3),
                Colors.black.withOpacity(0.5),
                Colors.black.withOpacity(0.7),
                Colors.black,
              ])),
        ),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
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
                const Text(
                  "Come Book Your Dream Car",
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Powered by",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
                const Spacer(),
                OutlinedBtn(
                  label: 'START TOUR',
                ),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 10,
                ),
                TxtButton(
                  label: "SIGN IN",
                  backgroundColor: ColorsData.Primary,
                  Page: SigninScreen(),
                ),

                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      )
    ]);
  }
}
