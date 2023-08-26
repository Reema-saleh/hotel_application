import 'package:flutter/material.dart';
import 'package:hotel_application/components/appbar_widget.dart';
import 'package:hotel_application/components/city_card_widget.dart';

class AllCities extends StatelessWidget {
  const AllCities({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> cities = [
      const CityCard(path: 'assets/images/2.png', cityName: 'Paris'),
      const CityCard(path: 'assets/images/3.png', cityName: 'London'),
      const CityCard(path: 'assets/images/4.png', cityName: 'Bangkok'),
      const CityCard(path: 'assets/images/5.png', cityName: 'Rome'),
      const CityCard(path: 'assets/images/6.png', cityName: 'Jakarta'),
    ];
    return Scaffold(
      appBar: appBarWidget('Cities'),
      body: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          mainAxisExtent: 150,
        ),
        itemBuilder: (BuildContext context, int index) {
          return cities[index];
        },
        itemCount: cities.length,
      ),
    );
  }
}
