import 'package:car_list/constants/theme.dart';
import 'package:car_list/utils/size_utils2.dart';
import 'package:flutter/material.dart';

class ExploreCard extends StatelessWidget {
  final String carType;
  const ExploreCard({Key? key, required this.carType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //Navigate.instance.toRoute(const RestaurantDetailPage());
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: defaultPadding, horizontal: defaultPadding),
              child: Text(
                carType,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: defaultPadding,
                    fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defaultPadding)),
      ),
    );
  }
}
