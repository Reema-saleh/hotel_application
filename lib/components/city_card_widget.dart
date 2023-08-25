import 'package:flutter/material.dart';
import 'package:hotel_application/constants/colors.dart';
import 'package:hotel_application/constants/spaces.dart';

class CityCard extends StatelessWidget {
  const CityCard({super.key, required this.path, required this.cityName});
  final String path;
  final String cityName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: AppColors.lightBlue),
          child: Image.asset('assets/images/2.png'),
        ),
        kHSpace8,
        const Text('Paris')
      ],
    );
  }
}
