import 'package:flutter/material.dart';
import 'package:gradient_coloured_buttons/gradient_coloured_buttons.dart';
import 'package:hotel_application/components/image_widget.dart';
import 'package:hotel_application/extension/screen_size.dart';
import 'package:hotel_application/models/hotel.dart';

class HotelInfo extends StatefulWidget {
  const HotelInfo({super.key, required this.hotelObject});
  final HotelModel hotelObject;
  @override
  State<HotelInfo> createState() => _HotelInfoState();
}

class _HotelInfoState extends State<HotelInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              ImageWidget(
                path: widget.hotelObject.hotelImage!,
                imgHeight: context.getHeight / 2.5,
                imgWidth: context.getWidth,
              ),
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
                top: context.getHeight / 3,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  width: context.getWidth,
                  height: context.getHeight,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25),
                          topLeft: Radius.circular(25))),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: context.getWidth,
                          child: Row(children: [
                            Text(widget.hotelObject.hotelName!,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            const Spacer(),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.favorite_outline))
                          ]),
                        ),
                        // Text(
                        //   widget.hotelObject.hotelCity ?? 'no city found',
                        //   style: const TextStyle(color: Colors.grey),
                        // ),
                        // const Row(
                        //   children: [
                        //     Icon(
                        //       Icons.star,
                        //       color: Colors.yellow,
                        //     ),
                        //     Text('4.8(131 reviwes)')
                        //   ],
                        // ),
                        // const Text(
                        //   'Description',
                        //   style: TextStyle(
                        //       fontSize: 20, fontWeight: FontWeight.bold),
                        // ),
                        // SizedBox(
                        //   width: context.getWidth - 20,
                        //   child: Text(widget.hotelObject.hotelDescription ??
                        //       'no description found'),
                        // ),
                        // const Text(
                        //   'Facilities',
                        //   style: TextStyle(
                        //       fontSize: 20, fontWeight: FontWeight.bold),
                        // ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //   children: [
                        //     facilitiesContainer(widget.hotelObject.facilities ??
                        //         ['no facilities found'])
                        //   ],
                        // ),
                        // const Text(
                        //   'Reviews',
                        //   style: TextStyle(
                        //       fontSize: 20, fontWeight: FontWeight.bold),
                        // ),
                      ]),
                ),
              ),
              Positioned(
                top: context.getHeight / 2,
                child: 
                FixedButton(widget: widget),
              )
            ],
          ),
        ],
      ),
    );
  }
}

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

facilitiesContainer(List<String> list) {
  for (var element in list) {
    return Container(
      width: 50,
      decoration: BoxDecoration(
          border: Border.all(), borderRadius: BorderRadius.circular(30)),
      child: Text(element),
    );
  }
}
