import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hotel_application/components/city_card_widget.dart';
import 'package:hotel_application/components/hotel_card_widget.dart';
import 'package:hotel_application/components/searchBar_widget.dart';
import 'package:hotel_application/constants/spaces.dart';
import 'package:hotel_application/db_services/services.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUserEmail =
        SupabaseClass.supabase.auth.currentSession?.user.email;
    return Scaffold(
      body: ListView(
        children: [
          SearchBarWidget(
            currentUserEmail: currentUserEmail ?? '',
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Popular cities',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    TextButton(onPressed: () {}, child: const Text('See all')),
                  ],
                ),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    CityCard(path: 'assets/images/2.png', cityName: 'Paris'),
                    kWSpace8,
                    CityCard(path: 'assets/images/3.png', cityName: 'London'),
                    kWSpace8,
                    CityCard(path: 'assets/images/4.png', cityName: 'Bangkok'),
                    kWSpace8,
                    CityCard(path: 'assets/images/5.png', cityName: 'Rome'),
                    kWSpace8,
                    CityCard(path: 'assets/images/6.png', cityName: 'Jakarta'),
                    kWSpace8,
                  ]),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Popular cities',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    TextButton(onPressed: () {}, child: const Text('See all')),
                  ],
                ),
                const SingleChildScrollView(
                  child: Row(children: [
                    HotelCard(
                        path: 'assets/images/7.png',
                        title: 'The east..',
                        subtitle1: 'subtitle1',
                        price: 200),
                    HotelCard(
                        path: 'assets/images/8.png',
                        title: 'The east..',
                        subtitle1: 'subtitle1',
                        price: 200),
                  ]),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
