import 'package:car_list/constants/theme.dart';
import 'package:car_list/helpers/color.helper.dart';
import 'package:car_list/widgets/buttons/all.dart';

import 'package:car_list/widgets/widgets.dart';
import 'package:car_list/constants/controllers.dart';
import 'package:car_list/models/model_model.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './fields.dart';

class Result extends StatelessWidget {
  const Result({Key? key}) : super(key: key);

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
                child: CustomScrollView(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    slivers: [
                      //AppBar
                      SliverList(
                          delegate: SliverChildListDelegate([
                        SizedBox(
                          width: double.infinity,
                          child: Container(
                            child: Stack(
                              children: [
                                const Align(
                                    alignment: Alignment.topRight,
                                    child: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.local_mall_outlined,
                                        color: ColorsData.text,
                                      ),
                                    )),
                              
                                Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: const [
                                            Text(
                                              "Car",
                                              style: TextStyle(
                                                  color: ColorsData.Primary,
                                                  fontSize:
                                                      defaultPadding * 1.4,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Text(
                                              "Mpare",
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
                          height: defaultPadding,
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const InputField(
                                inputType: TextInputType.name,
                                hint: 'Car Make',
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              const InputField(
                                inputType: TextInputType.name,
                                hint: 'Car Model',
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              const InputField(
                                inputType: TextInputType.datetime,
                                hint: 'Year From',
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              const InputField(
                                inputType: TextInputType.datetime,
                                hint: 'Year To',
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              TxtButton(
                                label: 'Find Car',
                                Page: Fields(),
                              )
                            ])
                      ])),
                    ]))));
  }
}

DropdownMenuItem<String> buildMenuItem(Make item) =>
    DropdownMenuItem(child: Text(item.name));
