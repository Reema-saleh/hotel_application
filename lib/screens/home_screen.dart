import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hotel_application/components/city_card_widget.dart';
import 'package:hotel_application/components/gradient_button_widget.dart';
import 'package:hotel_application/components/hotel_card_widget.dart';
import 'package:hotel_application/components/searchBar_widget.dart';
import 'package:hotel_application/constants/colors.dart';
import 'package:hotel_application/constants/spaces.dart';
import 'package:hotel_application/db_services/services.dart';
import 'package:hotel_application/utilitis/extension/nav.dart';
import 'package:hotel_application/screens/AllCities_screen.dart';
import 'package:hotel_application/screens/search_by_city.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUserId = SupabaseClass.supabase.auth.currentSession?.user.id;
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          SearchBarWidget(
            currentUserId: currentUserId ?? '',
          ),
          kHSpace8,
          Column(
            children: [
              GradientButtonWidget(
                text: 'Or Search By City',
                onPressed: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) => SearchByCity());
                },
                width: 150,
              ),
            ],
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
                    TextButton(
                        onPressed: () {
                          AllCities().push(context);
                        },
                        child: const Text('See all')),
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
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    FutureBuilder(
                        future: SupabaseClass().getAllHotels(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(
                              child: LoadingAnimationWidget.newtonCradle(
                                color: AppColors.primary,
                                size: 150,
                              ),
                            );
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            final hotel = snapshot.data;

                            return Row(
                              children: [
                                for (var index = 0; index < 6; index++) ...[
                                  Row(
                                    children: [
                                      HotelCard(
                                          path: hotel?[index].hotelImage ?? '',
                                          title: hotel?[index].hotelName ?? '',
                                          subtitle1:
                                              hotel?[index].hotelCity ?? '',
                                          price:
                                              hotel?[index].roomPrice ?? 0.0),
                                      kWSpace16
                                    ],
                                  )
                                ]
                              ],
                            );
                          } else {
                            return const Text("Sorry..");
                          }
                        })
                  ]),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
