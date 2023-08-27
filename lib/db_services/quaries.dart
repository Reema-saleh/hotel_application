import 'package:hotel_application/models/hotel.dart';
import 'package:hotel_application/models/reservation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:hotel_application/models/review.dart';

class SupabaseViewServices {
  static final supabase = Supabase.instance.client;

  Future<List<HotelModel>> getHotelsInfo() async {
    final rawHotels = await supabase.from('hotel').select(
        'hotel_id, hotel_name, hotel_city, hotel_description, room_price, num_rooms, hotel_image, facilities');
    List<HotelModel> hotels = [];
    for (var element in rawHotels) {
      hotels.add(HotelModel.fromJson(element));
    }
    return hotels;
  }

  Future<List<Review>> getReviewsByHotelId(String hotelId) async {
    final rawReviews = await supabase
        .from('review')
        .select('review_id, commit, rating')
        .eq(hotelId, 'hotel_id');
    List<Review> reviews = [];
    for (var element in rawReviews) {
      reviews.add(Review.fromJson(element));
    }
    return reviews;
  }

  Future<List<Reservation>> getReservationByUserId(String userId) async {
    final rawReservation = await supabase
        .from('reservation')
        .select('reservation_id, nights_booked, price, date')
        .eq('user_id', userId);
    List<Reservation> reservation = [];
    for (var element in rawReservation) {
      reservation.add(Reservation.fromJson(element));
    }
    return reservation;
  }

  Future<List<HotelModel>> getHotelInfoforReservation(String userId) async {
    List<HotelModel> hotels = [];
    final hotelId = await supabase
        .from('reservation')
        .select('hotel_id')
        .eq('user_id', userId);
    print(hotelId.runtimeType);

    if (hotelId == null) {
      return hotels;
    } else {
      final rawHotels = await supabase
          .from('hotel')
          .select(
              'hotel_id, hotel_name, hotel_city, room_price, num_rooms, hotel_image')
          .eq('hotel_id', '8c5c1bed-14b0-4704-a6d3-a876a1a48668');
      for (var element in rawHotels) {
        hotels.add(HotelModel.fromJson(element));
      }
    }

    return hotels;
  }

  Future updateReservation(Reservation reservation) async {
    final supabase = Supabase.instance.client;
    await supabase.from('reservation').update({
      'nights_booked': reservation.nightsBooked,
      'date': reservation.date,
      'price': reservation.price
    }).eq('reservation_id', reservation.reservationId ?? '');
  }

  Future insertReservation(Reservation reservation) async {
    final supabase = Supabase.instance.client;
    await supabase.from('reservation').insert(reservation.toJson());
  }

  Future deleteReservation(String reservationId) async {
    final supabase = Supabase.instance.client;
    await supabase
        .from('reservation')
        .delete()
        .eq('reservation_id', reservationId);
  }
}
