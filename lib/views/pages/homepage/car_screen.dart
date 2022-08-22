import 'package:car_list/helpers/color.helper.dart';
import 'package:car_list/views/pages/homepage/compare_screen.dart';
import 'package:flutter/material.dart';
import 'package:car_list/constants/controllers.dart';

import 'package:car_list/data/vehicles.dart';
import 'package:car_list/constants/controllers.dart';
import 'package:car_list/models/image_model.dart';
import 'package:car_list/models/vehicle_model.dart';
import 'package:get/get.dart';

class CarScreen extends StatelessWidget {
  final Result result;
  const CarScreen({Key? key, required this.result}) : super(key: key);

  List<Widget> buildPageIndicator() {
    List<Widget> list = [];
    for (var i = 0; i < [].length; i++) {
      list.add(buildIndicator(i == appController.currentImage.value));
    }
    return list;
  }

  Widget buildIndicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 6),
      height: 8,
      width: isActive ? 20 : 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.black : Colors.grey[400],
        borderRadius: const BorderRadius.all(
          const Radius.circular(12),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    appController.currentImage(0);
    Future<List<ImageModel>> images = vehicleController.getImages(result.slug);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                  width: 45,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                    border: Border.all(
                                      color: Colors.grey,
                                      width: 1,
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.keyboard_arrow_left,
                                    color: Colors.black,
                                    size: 28,
                                  )),
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap:() => appController.setCar(result) ,
                                  child: Container(
                                    width: 45,
                                    height: 45,
                                    decoration: const BoxDecoration(
                                      color: ColorsData.Primary,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.bookmark_border,
                                      color: Colors.white,
                                      size: 22,
                                    )),
                                ),
                                
                                const SizedBox(
                                  width: 16,
                                ),
                                Container(
                                    width: 45,
                                    height: 45,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                      border: Border.all(
                                        color: Colors.grey,
                                        width: 1,
                                      ),
                                    ),
                                    child: const Icon(
                                      Icons.share,
                                      color: Colors.black,
                                      size: 22,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          result.model.make.name,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 27,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          result.model.name,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Expanded(
                        child: Container(
                          child: FutureBuilder<List<ImageModel>>(
                            future: images,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return PageView(
                                  physics: const BouncingScrollPhysics(),
                                  onPageChanged: (int page) {
                                    appController.currentImage(page);
                                  },
                                  children: snapshot.data!.map((path) {
                                    return Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                      ),
                                      child: Hero(
                                        tag: result.model.name,
                                        child: Image.network(
                                          path.image,
                                          fit: BoxFit.scaleDown,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                );
                              } else {
                                return Image.asset(
                                  'assets/images/benz.png',
                                  fit: BoxFit.fitWidth,
                                );
                              }
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      [].length > 1
                          ? Container(
                              margin: const EdgeInsets.symmetric(vertical: 16),
                              height: 30,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: buildPageIndicator(),
                              ),
                            )
                          : Container(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            buildPricePerPeriod(
                              "Avarage",
                              (result.sellingPrice * 0.94).toString().substring(0, result.sellingPrice.toString().length - 3)+'K',
                              true,
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            buildPricePerPeriod(
                              "Highest",
                              (result.sellingPrice * 1.02).toString().substring(0, result.sellingPrice.toString().length - 3)+'K',
                              false,
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            buildPricePerPeriod(
                              "Lowest",
                              (result.sellingPrice * 1).toString().substring(0, result.sellingPrice.toString().length - 3)+'K',
                              false,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 16, left: 16, right: 16),
                      child: Text(
                        "SPECIFICATIONS",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[400],
                        ),
                      ),
                    ),
                    Container(
                      height: 80,
                      padding: const EdgeInsets.only(
                        top: 8,
                        left: 16,
                      ),
                      margin: const EdgeInsets.only(bottom: 16),
                      child: ListView(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: [
                          buildSpecificationCar("Color", result.color),
                          buildSpecificationCar("Trnasmision", result.transmissionType),
                          buildSpecificationCar("Engene Size", result.engineSize),
                          buildSpecificationCar("year", result.year.toString()),
                          buildSpecificationCar("Drive Type", result.driveType),
                          buildSpecificationCar("Body Type", result.bodyType),
                          buildSpecificationCar("Milage", result.mileage.toString()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 90,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Best Price ",
                  style: TextStyle(
                    color: ColorsData.DarkBg,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children:  [
                    Text(
                      "KSH "+(result.sellingPrice * 1).toString().substring(0, result.sellingPrice.toString().length - 3)+'K',
                      style: const TextStyle(
                        color: ColorsData.Primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                if(appController.car?.value != null){
                  Get.to(CompareScreen( result: appController.car!.value,));
                }
                
              },
              child: Container(
                height: 50,
                decoration: const BoxDecoration(
                  color: ColorsData.Primary,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      "Compare Car",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPricePerPeriod(String months, String price, bool selected) {
    return Expanded(
      child: Container(
        height: 110,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: selected ? ColorsData.Primary : Colors.white,
          borderRadius: const BorderRadius.all(
            const Radius.circular(15),
          ),
          border: Border.all(
            color: Colors.grey,
            width: selected ? 0 : 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              months + " Price",
              style: TextStyle(
                color: selected ? Colors.white : Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Container(),
            ),
            Text(
              price,
              style: TextStyle(
                color: selected ? Colors.white : Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "KSH",
              style: TextStyle(
                color: selected ? Colors.white : Colors.black,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSpecificationCar(String title, String data) {
    return Container(
      width: 130,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title.toUpperCase(),
            style: const TextStyle(
              color: ColorsData.text,
              fontSize: 13,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            data.toUpperCase(),
            style: const TextStyle(
              color: ColorsData.DarkBg,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
