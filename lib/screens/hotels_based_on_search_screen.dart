import 'package:flutter/material.dart';
import 'package:hotel_application/components/appbar_widget.dart';
import 'package:hotel_application/components/hotel_card_widget.dart';
import 'package:hotel_application/constants/colors.dart';
import 'package:hotel_application/db_services/services.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class HotelsBasedOnSearch extends StatelessWidget {
  const HotelsBasedOnSearch({super.key, this.city, this.name});
  final String? city;
  final String? name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('Hotels'),
      body: FutureBuilder(
        future: city != ''
            ? SupabaseClass().getHotelsBasedOnCity(city: city)
            : SupabaseClass().getHotelsBasedOnName(name: name),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: LoadingAnimationWidget.newtonCradle(
                color: AppColors.primary,
                size: 150,
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            final hotel = snapshot.data;
            return GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 24,
                mainAxisSpacing: 8,
                mainAxisExtent: 250,
              ),
              itemBuilder: (BuildContext context, int index) {
                return HotelCard(
                    path: hotel?[index].hotelImage ??
                        'https://freesvg.org/storage/img/thumb/errname1.png',
                    title: hotel?[index].hotelName ?? '',
                    subtitle1: snapshot.data?[index].hotelCity ?? '',
                    price: hotel?[index].roomPrice ?? 0.0);
              },
              itemCount: hotel?.length,
            );
          } else {
            return const Text("Sorry..");
          }
        },
      ),
    );
  }
}
