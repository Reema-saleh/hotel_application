import 'package:flutter/material.dart';
import 'package:hotel_application/components/image_widget.dart';
import 'package:hotel_application/constants/spaces.dart';
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
      body: SingleChildScrollView(
        child: Column(
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
                    child: Column(children: [
                      kHSpace8,
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
                      )
                    ]),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
