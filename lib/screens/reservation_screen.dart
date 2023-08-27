import 'package:elegant_notification/elegant_notification.dart';
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
import 'package:scroll_date_picker/scroll_date_picker.dart';
import 'package:hotel_application/db_services/quaries.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({super.key, required this.hotelObject});
  final HotelModel hotelObject;
  @override
  State<ReservationScreen> createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  DateTime selectedDate = DateTime.now();
  TextEditingController nightsController = TextEditingController();
  TextEditingController codeController = TextEditingController();

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
                        SizedBox(
                          height: 250,
                          child: ScrollDatePicker(
                            selectedDate: selectedDate,
                            locale: const Locale('en'),
                            onDateTimeChanged: (DateTime value) {
                              setState(() {
                                selectedDate = value;
                              });
                            },
                          ),
                        ),
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
                const Divider(
                  endIndent: 20,
                  color: Colors.grey,
                  thickness: 1,
                ),
                kHSpace16,
                TextfieldWidget(
                  label: 'Nights',
                  hintText: 'Enter number of nights',
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
                TextfieldWidget(
                  label: 'add coupon:',
                  controller: codeController,
                  textFun: (value) {
                    setState(() {});
                  },
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
                            coupon: codeController.text)
                        .toString())
                  ],
                ),
                kHSpace16,
                GradientButtonWidget(
                    text: 'Book Now',
                    onPressed: () async {
                      if (nightsController.text.isNotEmpty) {
                        final Reservation object = Reservation(
                          date: selectedDate.toString(),
                          nightsBooked: int.tryParse(nightsController.text),
                          price: getTotalPrice(
                              price: widget.hotelObject.roomPrice ?? 0,
                              nights: int.tryParse(nightsController.text)),
                        );
                        SupabaseViewServices().insertReservation(object);
                        Navigator.pop(context);
                      } else {
                        ElegantNotification.info(
                                title: const Text("Info"),
                                description: const Text(
                                    "Please don't leave the field empty"))
                            .show(context);
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
