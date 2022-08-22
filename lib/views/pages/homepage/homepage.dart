import 'package:car_list/constants/theme.dart';
import 'package:car_list/helpers/color.helper.dart';
import 'package:car_list/data/vehicles.dart';
import 'package:car_list/models/image_model.dart';
import 'package:car_list/models/vehicle_model.dart';
import 'package:car_list/widgets/buttons/all.dart';

import 'package:car_list/constants/controllers.dart';

import 'package:car_list/utils/size_utils2.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:car_list/views/pages/homepage/components/card_list.dart';
import 'package:car_list/widgets/widgets.dart';
import 'package:car_list/constants/controllers.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<VehicleModel> vehicles = vehicleController.getVehicles(1);
    Future<VehicleModel> newVehicles = vehicleController.getVehicles(2);
    

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
                                Container(
                                  height: defaultPadding * 3,
                                  width: defaultPadding * 3,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/benz.png'))),
                                )
                              ],
                            ),
                            padding: const EdgeInsets.only(top: 20),
                          ),
                        ),
                        const SizedBox(
                          height: defaultPadding,
                        ),
                      ])),
                      SliverList(
                          delegate: SliverChildListDelegate([
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 0, top: 0),
                            child: Row(
                                children:
                                    List.generate(bodyType.length, (index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 25),
                                child: GestureDetector(
                                  onTap: () {
                                    navController.typeMenu(index);

                                    // setState(() {
                                    //   activeMenu1 = index;
                                    // });
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        bodyType[index],
                                        style: TextStyle(
                                            fontSize: 15,
                                            color:
                                                navController.typeMenu.value ==
                                                        index
                                                    ? ColorsData.Primary
                                                    : ColorsData.text,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      navController.typeMenu.value == index
                                          ? Container(
                                              width: 50,
                                              height: 3,
                                              decoration: BoxDecoration(
                                                  color: ColorsData.Primary,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                            )
                                          : Container()
                                    ],
                                  ),
                                ),
                              );
                            })),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: defaultPadding),
                          child: Text(
                            'Featured Cars',
                            style: TextStyle(
                              color: Colors.black.withOpacity(.7),
                              fontSize: defaultPadding * 1.5,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Container(
                          height: 250,
                          child: FutureBuilder<VehicleModel>(
                            future: vehicles,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return ListView.builder(
                                    itemCount: snapshot.data!.results.length,
                                    physics: const BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      var car = snapshot.data!.results[index];
                                      var results = snapshot.data!.results;
                                      return NewCarCard(
                                        condition: results[index].condition,
                                        make: results[index].model.make.name,
                                        model: results[index].model.name,
                                        price: results[index].sellingPrice,
                                        slug: results[index].slug,
                                        result: results[index],
                                      );
                                    });
                              } else {
                                return Text('No Found');
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: defaultPadding),
                          child: Text(
                            'New Arrivals',
                            style: TextStyle(
                              color: Colors.black.withOpacity(.7),
                              fontSize: defaultPadding * 1.5,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Container(
                          height: 250,
                          child: FutureBuilder<VehicleModel>(
                            future: newVehicles,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return ListView.builder(
                                    itemCount: snapshot.data!.results.length,
                                    physics: const BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      var car = snapshot.data!.results[index];
                                      var results = snapshot.data!.results;
                                      return NewCarCard(
                                        condition: results[index].condition,
                                        make: results[index].model.make.name,
                                        model: results[index].model.name,
                                        price: results[index].sellingPrice,
                                        slug: results[index].slug,
                                        result: results[index],
                                      );
                                    });
                              } else {
                                return Text('No Found');
                              }
                            },
                          ),
                        ),
                      ])),

                     
                      // GridView.builder(
                      //     shrinkWrap: true,
                      //     itemCount: 15,
                      //     gridDelegate:
                      //         SliverGridDelegateWithFixedCrossAxisCount(
                      //             crossAxisCount: Responsive.isMobile(context)
                      //                 ? 2
                      //                 : Responsive.isMobileLarge(context)
                      //                     ? 3
                      //                     : 4,
                      //             crossAxisSpacing: defaultPadding,
                      //             mainAxisSpacing: defaultPadding),
                      //     itemBuilder: (context, index) {
                      //       return const NewCarCard();
                      //     })
                    ]))));
  }
}
