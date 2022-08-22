import 'package:car_list/constants/theme.dart';
import 'package:car_list/utils/size_utils.dart';
import 'package:car_list/utils/size_utils2.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/electric_list.dart';

class Electric extends StatefulWidget {
  const Electric({Key? key}) : super(key: key);

  @override
  State<Electric> createState() => _ElectricState();
}

class _ElectricState extends State<Electric> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
                width: double.infinity,
                height: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding * 1.2,
                  //vertical: defaultPadding * 0.1,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //AppBar
                      SizedBox(
                        width: double.infinity,
                        child: Container(
                          child: Stack(
                            children: [
                              const Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "New Cars",
                                    style: TextStyle(color: Colors.black),
                                  )),
                              GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.black,
                                    size:
                                        Responsive.isTablet(context) ? 25 : 15,
                                  )),
                            ],
                          ),
                          padding: const EdgeInsets.only(top: 20),
                        ),
                      ),

                      const SizedBox(
                        height: defaultPadding * 1.4,
                      ),
                      const Expanded(
                        child: Center(child:Text('Car Not Found'),),
                      )
                    ]))));
  }
}
