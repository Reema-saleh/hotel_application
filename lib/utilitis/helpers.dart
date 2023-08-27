import 'package:flutter/material.dart';
import 'package:hotel_application/db_services/quaries.dart';
import 'package:hotel_application/main.dart';
import 'package:hotel_application/models/hotel.dart';
import 'package:hotel_application/screens/my_bookings_list_screen.dart';

double getTotalPrice({required double price, required nights, String? coupon}) {
  // ignore: unused_local_variable
  double totalPrice = 0;
  if (coupon != null && price != 0) {
    return totalPrice = (price * nights) - 50;
  } else {
    return totalPrice = price * nights;
  }
}

facilitiesContainer(List<String> list) {
  for (var element in list) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
          border: Border.all(), borderRadius: BorderRadius.circular(30)),
      child: Center(
          child: Text(
        element,
        style: const TextStyle(fontSize: 15),
      )),
    );
  }
}

Future<List<HotelModel>> gethotelInfo(String userId) async {
  final List<HotelModel> listInfo =
      await SupabaseViewServices().getHotelInfoforReservation(userId);
  return listInfo;
}

getFutureWidget() async {
  List<HotelModel> hotels = await gethotelInfo(currentUserId!);
  return FutureBuilder(
    future: SupabaseViewServices().getReservationByUserId(currentUserId!),
    builder: (context, snapshot) {
      final list = snapshot.data;

      return MyBookingScreen(reserveList: list ?? [], hotelWReserve: hotels);
    },
  );
}
