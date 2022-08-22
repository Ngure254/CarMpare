import 'package:car_list/models/vehicle_model.dart';
import 'package:car_list/widgets/single_car-card/car_card.dart';
import 'package:flutter/material.dart';
import 'package:car_list/constants/controllers.dart';

class GarageList extends StatelessWidget {
  const GarageList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Future<VehicleModel> newVehicles = vehicleController.getVehicles(4);

    return SingleChildScrollView(
      child: FutureBuilder<VehicleModel>(
        future: newVehicles,
        builder: (context, snapshot) {
          var results = snapshot.data!.results;
          return Column(
            children: [
              for (int i = 0; i < results.length; i++)
                CarCard(
                  result: results[i],
                ),
            ],
          );
        },
      ),
    );
  }
}
