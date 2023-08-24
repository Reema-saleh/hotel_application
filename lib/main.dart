import 'package:flutter/material.dart';
import 'package:hotel_booking/db_services/services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
      url: 'https://isfjeumhjwwekanmusdm.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlzZmpldW1oand3ZWthbm11c2RtIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTI4NjM0MDUsImV4cCI6MjAwODQzOTQwNX0.LmfFAO5Mq6gexwdD5HOxJq34ENDubB78Ebx5jEZ39xQ');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                return Center(child: Text(snapshot.data.toString()));
              })),
    );
  }
}
