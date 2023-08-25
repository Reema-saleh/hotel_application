import 'package:hotel_application/models/hotel.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

class SupabaseViewServices {
  static final supabase = Supabase.instance.client;

  Future <List<HotelModel>> getHotelsInfo() async {
    final rawHotels = await supabase.from('hotel').select(
        'hotel_id, hotel_name, hotel_city, hotel_description, room_price, num_rooms, hotel_image, facilities');
    List<HotelModel> hotels = [];
    for (var element in rawHotels) {
      hotels.add(HotelModel.fromJson(element));
    }
    return hotels;
  }
}
