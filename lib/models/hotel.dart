class HotelModel {
  String? hotelId;
  String? hotelName;
  String? hotelCity;
  String? hotelDescription;
  double? roomPrice;
  int? numRooms;
  String? hotelImage;
  List<String>? facilities;

  HotelModel(
      {this.hotelId,
      this.hotelName,
      this.hotelCity,
      this.hotelDescription,
      this.roomPrice,
      this.numRooms,
      this.hotelImage,
      this.facilities});

  HotelModel.fromJson(Map<String, dynamic> json) {
    hotelId = json['hotel_id'];
    hotelName = json['hotel_name'];
    hotelCity = json['hotel_city'];
    hotelDescription = json['hotel_description'];
    roomPrice = json['room_price'];
    numRooms = json['num_rooms'];
    hotelImage = json['hotel_image'];
    facilities = json['facilities'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['hotel_id'] = hotelId;
    data['hotel_name'] = hotelName;
    data['hotel_city'] = hotelCity;
    data['hotel_description'] = hotelDescription;
    data['room_price'] = roomPrice;
    data['num_rooms'] = numRooms;
    data['hotel_image'] = hotelImage;
    data['facilities'] = facilities;
    return data;
  }
}
