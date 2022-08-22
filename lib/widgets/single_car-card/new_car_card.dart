import 'package:car_list/helpers/color.helper.dart';
import 'package:car_list/models/image_model.dart';
import 'package:car_list/models/vehicle_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:car_list/constants/controllers.dart';
import 'package:car_list/views/pages/homepage/car_screen.dart';

class NewCarCard extends StatelessWidget {
  final String condition;
  final String model;
  final String make;
  final int price;
  final String slug;
  final Result result;
  const NewCarCard(
      {Key? key,
      required this.condition,
      required this.model,
      required this.make,
      required this.price,
      required this.slug,
      required this.result})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var vImage = vehicleController.getImage(slug);

    return GestureDetector(
      onTap: () {
        Get.to(CarScreen(result: result,));
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
        margin: const EdgeInsets.only(right: 0, left: 16),
        width: 220,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                decoration: const BoxDecoration(
                  color: ColorsData.Primary,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  child: Text(
                    condition,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 120,
              child: Center(
                child: Hero(
                  tag: model,
                  child: FutureBuilder<ImageModel>(
                    future: vImage,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Image.network(
                          snapshot.data!.image,
                          fit: BoxFit.fitWidth,
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
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              model,
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              make,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ColorsData.DarkBg,
                height: 1,
              ),
            ),
            Text(
              "Ksh" + price.toString(),
              style: const TextStyle(
                fontSize: 14,
                color: ColorsData.text,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
