// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hotel_application/components/appbar_widget.dart';
import 'package:hotel_application/components/gradient_button_widget.dart';
import 'package:hotel_application/components/image_widget.dart';
import 'package:hotel_application/components/textfield_widget.dart';
import 'package:hotel_application/constants/spaces.dart';
import 'package:hotel_application/extension/screen_size.dart';
import 'package:hotel_application/helpers.dart';
import 'package:hotel_application/models/hotel.dart';
import 'package:hotel_application/models/reservation.dart';
import 'package:hotel_application/db_services/quaries.dart';

class UpdateScreen extends StatefulWidget {
  UpdateScreen(
      {super.key, required this.hotelObject, required this.reserveObject});
  final HotelModel hotelObject;
  Reservation reserveObject;

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  TextEditingController dateController = TextEditingController();
  TextEditingController nightsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('Reserve Room'),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          child: Text(
                            widget.hotelObject.hotelName ?? 'fairnote hotel',
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ),
                        kHSpace16,
                        //date
                      ],
                    ),
                    kWSpace24,
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: ImageWidget(
                          path: widget.hotelObject.hotelImage ?? '',
                          imgHeight: context.getHeight / 4,
                          imgWidth: context.getWidth / 2.5),
                    ),
                  ],
                ),
                TextfieldWidget(
                  label: 'Date:',
                  hintText: '${widget.reserveObject.date}',
                  controller: dateController,
                  textFun: (value) {
                    setState(() {});
                  },
                ),
                kHSpace16,
                TextfieldWidget(
                  label: 'Nights:',
                  hintText: '${widget.reserveObject.nightsBooked}',
                  controller: nightsController,
                  textFun: (value) {
                    setState(() {});
                  },
                ),
                kHSpace16,
                Row(
                  children: [
                    kWSpace24,
                    Text('\$${widget.hotelObject.roomPrice}',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    const Text(' X '),
                    Text('${nightsController.text} Nights')
                  ],
                ),
                kHSpace16,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Total Price: ',
                    ),
                    Text(getTotalPrice(
                      price: widget.hotelObject.roomPrice ?? 0.0,
                      nights: int.tryParse(nightsController.text) ?? 1,
                    ).toString())
                  ],
                ),
                const Divider(
                  endIndent: 20,
                  color: Colors.grey,
                  thickness: 1,
                ),
                kHSpace16,
                GradientButtonWidget(
                    text: 'Update',
                    onPressed: () async {
                      if (nightsController.text.isNotEmpty) {
                        widget.reserveObject = Reservation(
                          date: dateController.text,
                          nightsBooked: int.tryParse(nightsController.text),
                          price: widget.hotelObject.roomPrice,
                        );
                        SupabaseViewServices()
                            .updateReservation(widget.reserveObject);
                        Navigator.pop(context);
                      }
                    }),
                kHSpace16,
                GradientButtonWidget(
                    text: 'Cancel',
                    onPressed: () {
                      SupabaseViewServices().deleteReservation(
                          widget.reserveObject.reservationId!);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
