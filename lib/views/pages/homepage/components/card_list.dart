import 'package:car_list/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CardList extends StatelessWidget {
  const CardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: const [
        ExploreCard(carType: 'New Cars'),
        ExploreCard(carType: 'Luxury'),
        ExploreCard(carType: 'Hybrid'),
        ExploreCard(carType: 'Electric'),
        ExploreCard(carType: 'Trucks'),
        ExploreCard(carType: 'Old Cars'),
        //for (int i = 0; i < 15; i++) const ExploreCard(),
      ],
    );
  }
}
