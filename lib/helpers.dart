


double getTotalPrice({required double price, required nights, String? coupon}) {
  // ignore: unused_local_variable
  double totalPrice = 0;
  if (coupon != null && price != 0) {
    return totalPrice = (price * nights) - 50;
  } else {
    return totalPrice = price * nights;
  }
}
