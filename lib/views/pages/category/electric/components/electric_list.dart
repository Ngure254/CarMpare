import 'package:car_list/models/vehicle_model.dart';
import 'package:car_list/widgets/single_car-card/car_card.dart';
import 'package:car_list/constants/controllers.dart';
import 'package:flutter/material.dart';

class ElectricList extends StatelessWidget {
  const ElectricList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<VehicleModel>(
      future: vehicleController.getVehicles(4),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SingleChildScrollView(
            child: Column(
              children: [
                for (int i = 0; i < snapshot.data!.results.length; i++)
                  CarCard(
                    result: snapshot.data!.results[i],
                  ),
              ],
            ),
          );
        }else{
          return Text('No Car Found');
        }
      },
    );
  }
}
