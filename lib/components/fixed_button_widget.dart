import 'package:flutter/material.dart';
import 'package:hotel_application/components/gradient_button_widget.dart';
import 'package:hotel_application/utilitis/extension/screen_size.dart';
import 'package:hotel_application/models/hotel.dart';

class FixedButton extends StatelessWidget {
  const FixedButton({
    super.key,
    required this.hotelObject,
  });

  final HotelModel hotelObject;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade300,
      width: context.getWidth,
      height: 60,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Start From',
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  '\$${hotelObject.roomPrice}/night',
                  style: const TextStyle(fontSize: 15),
                )
              ],
            ),
            const Spacer(),
            GradientButtonWidget(
              text: 'Book Now',
              onPressed: () {},
              width: 200,
            )
          ],
        ),
      ),
    );
  }
}
