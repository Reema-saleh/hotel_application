class Reservation {
  String? reservationId;
  int? nightsBooked;
  double? price;
  String? date;

  Reservation({this.reservationId, this.nightsBooked, this.price, this.date});

  Reservation.fromJson(Map<String, dynamic> json) {
    reservationId = json["reservation_id"];
    nightsBooked = json["nights_booked"];
    price = json["price"];
    date = json["date"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["reservation_id"] = reservationId;
    data["nights_booked"] = nightsBooked;
    data["price"] = price;
    data["date"] = date;
    return data;
  }
}
