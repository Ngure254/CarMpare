import 'package:car_list/constants/theme.dart';
import 'package:car_list/helpers/color.helper.dart';
import 'package:get/get.dart';


import 'package:flutter/material.dart';

class Fields extends StatelessWidget {
  const Fields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
                width: double.infinity,
                height: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding * 1.2,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //AppBar
                      SizedBox(
                        width: double.infinity,
                        child: Container(
                          child: Stack(
                            children:  [
                               Align(
                                    alignment: Alignment.topRight,
                                    child:GestureDetector(
                                      onTap: () {
                                        Get.back();
                                      },
                                      child: const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.arrow_back,
                                        color: ColorsData.text,
                                      ),
                                    )),
                                    )
                                    ,
                                Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                        padding:  EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: const  [
                                            Text(
                                              "Car",
                                              style: TextStyle(
                                                  color: ColorsData.Primary,
                                                  fontSize:
                                                      defaultPadding * 1.4,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Text(
                                              "mpare",
                                              style: TextStyle(
                                                  color: Colors.amber,
                                                  fontSize:
                                                      defaultPadding * 1.4,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ],
                                        ))),
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
