import 'package:flutter/material.dart';
import 'package:hotel_application/components/fixed_button_widget.dart';
import 'package:hotel_application/components/hotel_info_container.dart';
import 'package:hotel_application/components/image_widget.dart';
import 'package:hotel_application/extension/screen_size.dart';
import 'package:hotel_application/models/hotel.dart';

class AllHotels extends StatelessWidget {
  const AllHotels({super.key, required this.hotelObject});
  final HotelModel hotelObject;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: context.getWidth,
                  height: context.getHeight,
                ),
                ImageWidget(
                    path: hotelObject.hotelImage!,
                    imgWidth: context.getWidth,
                    imgHeight: context.getHeight / 2.5),
                Positioned(
                  top: 55,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_circle_left,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
                Positioned(
                    top: context.getHeight / 2 - 100,
                    child: InfoContainer(hotelObject: hotelObject))
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: FixedButton(hotelObject: hotelObject),
    );
  }
}
