import 'package:flutter/material.dart';
import 'package:hotel_application/models/hotel.dart';
import 'package:hotel_application/models/user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseClass {
  static final supabase = Supabase.instance.client;

  Future<HotelUser> getUserName({required userEmail}) async {
    final rawData =
        await supabase.from('user').select('name').eq('email', userEmail);

    final List<HotelUser> users = [];
    for (final user in rawData) {
      users.add(HotelUser.fromJson(user));
    }
    if (users.isNotEmpty) {
      return users.first;
    }

    return HotelUser();
  }

  Future<List<HotelModel>> getHotelsBasedOnCity({required city}) async {
    final rawData = await supabase
        .from('hotel')
        .select(
            'hotel_id, hotel_name, hotel_city, hotel_description, room_price, num_rooms, hotel_image, facilities')
        .eq('hotel_city', city);
    debugPrint('$rawData');
    final List<HotelModel> hotels = [];
    for (var hotel in rawData) {
      hotels.add(HotelModel.fromJson(hotel));
    }

    return hotels;
  }

  Future<List<HotelModel>> getHotelsBasedOnName({required name}) async {
    final rawData = await supabase
        .from('hotel')
        .select(
            'hotel_id, hotel_name, hotel_city, hotel_description, room_price, num_rooms, hotel_image, facilities')
        .eq('hotel_name', name);
    debugPrint('$rawData');
    final List<HotelModel> hotels = [];
    for (var hotel in rawData) {
      hotels.add(HotelModel.fromJson(hotel));
    }

    return hotels;
  }

  Future<List<String>> getCitiesInDB() async {
    final rawData = await supabase.from('hotel').select('hotel_city');

    debugPrint('$rawData');
    final List<String> cities = [];
    for (var city in rawData) {
      cities.add(city["hotel_city"]);
    }

    return cities;
  }

  Future<List<String>> getHotelsNamesInDB() async {
    final rawData = await supabase.from('hotel').select('hotel_name');

    debugPrint('$rawData');
    final List<String> hotelsNames = [];
    for (var hotelName in rawData) {
      hotelsNames.add(hotelName["hotel_name"]);
    }

    return hotelsNames;
  }

  Future<List<HotelModel>> getAllHotels() async {
    final rawData = await supabase.from('hotel').select(
        'hotel_id, hotel_name, hotel_city, hotel_description, room_price, num_rooms, hotel_image, facilities');
    debugPrint('$rawData');
    final List<HotelModel> hotels = [];
    for (var hotel in rawData) {
      hotels.add(HotelModel.fromJson(hotel));
    }

    return hotels;
  }
}
