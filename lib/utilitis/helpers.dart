import 'package:flutter/material.dart';

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
