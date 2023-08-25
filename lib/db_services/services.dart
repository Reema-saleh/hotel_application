import 'package:hotel_application/models/user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseClass {
  static final supabase = Supabase.instance.client;

  Future<HotelUser> getUserName({userId}) async {
    final rawData =
        await supabase.from('user').select('name').eq('email', userId);

    final List<HotelUser> users = [];
    for (final user in rawData) {
      users.add(HotelUser.fromJson(user));
    }
    if (users.isNotEmpty) {
      return users.first;
    }

    return HotelUser();
  }
}
