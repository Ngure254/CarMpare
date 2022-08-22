import 'package:car_list/constants/theme.dart';
import 'package:car_list/helpers/color.helper.dart';
import 'package:car_list/models/image_model.dart';
import 'package:car_list/utils/size_utils2.dart';
import 'package:flutter/material.dart';
import 'package:car_list/models/vehicle_model.dart';
import 'package:get/get.dart';
import 'package:car_list/views/pages/homepage/car_screen.dart';
import 'package:car_list/constants/controllers.dart';

class CarCard extends StatelessWidget {
  final Result result;
  const CarCard({Key? key, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var vImage = vehicleController.getImage(result.slug);
    return GestureDetector(
      onTap: () {
        Get.to(CarScreen(result: result));
        //Navigate.instance.toRoute(const RestaurantDetailPage());
      },
      child: Card(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder<ImageModel>(
                future: vImage,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      height: Responsive.isTablet(context) ? 150 : 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(snapshot.data!.image),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(defaultPadding)),
                    );
                  } else {
                    return Container(
                      height: Responsive.isTablet(context) ? 150 : 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                              image: AssetImage('assets/images/benz.png'),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(defaultPadding)),
                    );
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: defaultPadding, horizontal: defaultPadding),
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      result.model.make.name + ' ' + result.model.name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                          color: ColorsData.Primary,
                          fontSize: defaultPadding,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Ksh " + result.sellingPrice.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: defaultPadding,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              )
            ],
          ),
          padding: EdgeInsets.all(defaultPadding * 0.2),
          width: double.infinity,
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defaultPadding)),
      ),
    );
  }
}
