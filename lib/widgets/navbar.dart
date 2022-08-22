import 'package:car_list/views/pages/all.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:car_list/controllers/nav_controller.dart';
import 'package:car_list/helpers/color.helper.dart';

class NavScreen extends StatelessWidget {
  final _screens = [
    const Home(),
    const Categories(),
    const Garage(),
    const Result(),
    const ProfileScreen(),
    
    
  ];

  NavScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavController>(
        builder: (controller) => Obx(
              () => Scaffold(
                body: Stack(
                  children: _screens
                      .asMap()
                      .map((i, screen) => MapEntry(
                            i,
                            Offstage(
                              offstage: controller.appIndex.value != i,
                              child: screen,
                            ),
                          ))
                      .values
                      .toList(),
                ),
                bottomNavigationBar: Visibility(
                  visible: true,
                  child: BottomNavigationBar(
                    elevation: 0,
                    selectedItemColor: ColorsData.Primary,
                    type: BottomNavigationBarType.fixed,
                    currentIndex: controller.appIndex.value < 5
                        ? controller.appIndex.value
                        : 3,
                    onTap: (i) => controller.appIndex(i),
                    items: const [
                      BottomNavigationBarItem(
                          icon: Icon(Icons.home_outlined),
                          activeIcon: Icon(Icons.home_outlined),
                          label: 'Home'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.align_horizontal_left_sharp),
                          activeIcon: Icon(Icons.align_horizontal_left_sharp),
                          label: 'Categories'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.directions_car_filled_outlined),
                          activeIcon: Icon(Icons.directions_car),
                          label: 'Garage'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.search_outlined),
                          activeIcon: Icon(Icons.search),
                          label: 'Search'),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.person_outline),
                          activeIcon: Icon(Icons.person),
                          label: 'Profile'),
                    ],
                  ),
                ),
              ),
            ));
  }
}
