
import 'package:flutter/material.dart';
import 'package:gradient_coloured_buttons/gradient_coloured_buttons.dart';
import 'package:hotel_application/screens/hotel_info_screen.dart';

class FixedButton extends StatelessWidget {
  const FixedButton({
    super.key,
    required this.widget,
  });

  final HotelInfo widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Start From'),
            Text('\$${widget.hotelObject.roomPrice}/night')
          ],
        ),
        GradientButton(text: 'Book Room', onPressed: () {})
      ],
    );
  }
}