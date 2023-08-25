import 'package:flutter/material.dart';
import 'package:hotel_application/components/appbar_widget.dart';
import 'package:hotel_application/components/hotel_card_widget.dart';
import 'package:hotel_application/extension/nav.dart';
import 'package:hotel_application/models/hotel.dart';
import 'package:hotel_application/screens/hotel_info_screen.dart';

class HotelsScreen extends StatelessWidget {
  const HotelsScreen({super.key, required this.hotelList});
  final List<HotelModel> hotelList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('Hotels'),
      body: GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(5),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 270,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8),
        itemCount: hotelList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              HotelInfo(hotelObject: hotelList[index]).push(context);
            },
            child: HotelCard(
                path: hotelList[index].hotelImage ??
                    'https://www.hotel.de/de/media/image/fb/62/a7/Fairmont_Jakarta-Jakarta-Hotel_outdoor_area-1-685582_600x600.jpg',
                title: hotelList[index].hotelName ?? 'Fairnot hotel',
                subtitle1: hotelList[index].hotelCity ?? 'Jakarta',
                price: hotelList[index].roomPrice ?? 150),
          );
        },
      ),
    );
  }
}
