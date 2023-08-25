import 'package:flutter/material.dart';
import 'package:hotel_application/components/appbar_widget.dart';
import 'package:hotel_application/components/hotel_card_widget.dart';

class HotelsScreen extends StatelessWidget {
  const HotelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarWidget('Hotels'),
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 20,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8),
          itemCount: 10,
          itemBuilder: (context, index) {
            return const HotelCard(
                path:
                    'https://www.hotel.de/de/media/image/fb/62/a7/Fairmont_Jakarta-Jakarta-Hotel_outdoor_area-1-685582_600x600.jpg',
                title: 'Fairnot hotel',
                subtitle1: 'Jakarta',
                price: 150);
          },
        ));
  }
}
