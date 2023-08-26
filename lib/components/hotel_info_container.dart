import 'package:flutter/material.dart';
import 'package:hotel_application/components/bold_text.dart';
import 'package:hotel_application/components/review_wiget.dart';
import 'package:hotel_application/db_services/quaries.dart';
import 'package:hotel_application/extension/screen_size.dart';
import 'package:hotel_application/helpers.dart';
import 'package:hotel_application/models/hotel.dart';

class InfoContainer extends StatelessWidget {
  const InfoContainer({super.key, required this.hotelObject});
  final HotelModel hotelObject;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      width: context.getWidth,
      height: context.getHeight / 2 + 100,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25), topLeft: Radius.circular(25))),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BoldText(text: hotelObject.hotelName!),
            Text(
              hotelObject.hotelCity ?? 'no city found',
              style: const TextStyle(color: Colors.grey, fontSize: 15),
            ),
            const Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Text(
                  '4.8(131 reviwes)',
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
            const BoldText(text: 'Description'),
            SizedBox(
              width: context.getWidth - 20,
              child: Text(
                hotelObject.hotelDescription ?? 'no description found',
                style: const TextStyle(fontSize: 15),
              ),
            ),
            const BoldText(text: 'Facilities'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                facilitiesContainer(
                    hotelObject.facilities ?? ['no facilities found']),
              ],
            ),
            const BoldText(text: 'Reviews'),
            FutureBuilder(
              future: SupabaseViewServices()
                  .getReviewsByHotelId(hotelObject.hotelId!),
              builder: (context, snapshot) {
                final list = snapshot.data;
                return Reviews(reviewList: list ?? []);
              },
            ),
          ]),
    );
  }
}
