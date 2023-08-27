import 'package:flutter/material.dart';
import 'package:hotel_application/components/appbar_widget.dart';
import 'package:hotel_application/components/hotel_card_widget.dart';
import 'package:hotel_application/models/hotel.dart';
import 'package:hotel_application/models/reservation.dart';

class MyBookingScreen extends StatelessWidget {
  const MyBookingScreen({
    super.key,
    required this.reserveList,
    required this.hotelWReserve,
  });
  final List<Reservation> reserveList;
  final List<HotelModel> hotelWReserve;
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
        itemCount: reserveList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              
            },
            child: HotelCard(
                path: hotelWReserve[index].hotelImage ??
                    'https://www.hotel.de/de/media/image/fb/62/a7/Fairmont_Jakarta-Jakarta-Hotel_outdoor_area-1-685582_600x600.jpg',
                title: hotelWReserve[index].hotelName ?? 'Fairnot hotel',
                subtitle1:
                    '${reserveList[index].nightsBooked}/Nights booked at date ${reserveList[index].date}',
                price: reserveList[index].price ?? 150),
          );
        },
      ),
    );
  }
}
