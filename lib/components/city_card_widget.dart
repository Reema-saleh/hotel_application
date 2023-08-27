import 'package:flutter/material.dart';
import 'package:hotel_application/constants/colors.dart';
import 'package:hotel_application/constants/spaces.dart';
import 'package:hotel_application/extension/nav.dart';
import 'package:hotel_application/screens/hotels_based_on_search_screen.dart';

class CityCard extends StatelessWidget {
  const CityCard({super.key, required this.path, required this.cityName});
  final String path;
  final String cityName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        HotelsBasedOnSearch(
          city: cityName,
        ).push(context);
      },
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppColors.lightBlue),
            child: Image.asset(path),
          ),
          kHSpace8,
          Text(cityName)
        ],
      ),
    );
  }
}
