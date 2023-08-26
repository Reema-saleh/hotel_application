import 'package:flutter/material.dart';
import 'package:hotel_application/components/bold_text.dart';
import 'package:hotel_application/extension/screen_size.dart';
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
      child: Stack(
        children: [
          Positioned(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                width: context.getWidth,
                child: BoldText(text: hotelObject.hotelName!),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
