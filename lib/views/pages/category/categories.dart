import 'package:car_list/constants/theme.dart';
import 'package:car_list/utils/size_utils.dart';
import 'package:car_list/utils/size_utils2.dart';
import 'package:car_list/views/pages/category/electric/electric.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: ListView(
          children: [
            const Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: defaultPadding),
                child: Text(
                  'Collections',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: defaultPadding * 1.3,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            MenuObject(
              image: "assets/icons/logo.png",
              menuText: "Electric",
              callback: () {
                Get.to(const Electric());
              },
            ),
            MenuObject(
              image: "assets/icons/logo2.png",
              menuText: "New Cars",
              callback: () {
                Get.to(const Electric());
              },
            ),
            MenuObject(
              image: "assets/icons/logo.png",
              menuText: "Luxury",
              callback: () {
                Get.to(const Electric());
              },
            ),
            MenuObject(
              image: "assets/icons/logo2.png",
              menuText: "Hybrid",
              callback: () {
                Get.to(const Electric());
              },
            ),
            MenuObject(
              image: "assets/icons/logo.png",
              menuText: "Trucks",
              callback: () {
                Get.to(const Electric());
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MenuObject extends StatelessWidget {
  final image;
  final String menuText;
  final VoidCallback callback;

  MenuObject(
      {required this.menuText, required this.image, required this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: defaultPadding * 2, vertical: defaultPadding / 2),
      height: Responsive.isMobile(context)
          ? 70
          : Responsive.isMobileLarge(context)
              ? 100
              : 150,
      child: InkWell(
        splashColor: Theme.of(context).splashColor,
        onTap: () => callback(),
        child: Stack(
          clipBehavior: Clip.antiAlias,
          children: [
            Image(
              image: Image.asset(image).image,
              width: SizeConfig.screenWidth,
              //height: SizeConfig.screenHeight / 3,
              fit: BoxFit.cover,
            ),
            Container(
              width: double.infinity,
              height: double.infinity / 3,
              decoration: BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.5)),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      menuText,
                      style: const TextStyle(
                          fontSize: defaultPadding,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
