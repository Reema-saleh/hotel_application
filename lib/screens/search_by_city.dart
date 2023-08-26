import 'package:flutter/material.dart';
import 'package:hotel_application/components/gradient_button_widget.dart';
import 'package:hotel_application/components/textfield_widget.dart';
import 'package:hotel_application/constants/colors.dart';
import 'package:hotel_application/constants/spaces.dart';
import 'package:hotel_application/db_services/services.dart';
import 'package:hotel_application/extension/nav.dart';
import 'package:hotel_application/screens/hotels_based_on_search_screen.dart';

class SearchByCity extends StatefulWidget {
  const SearchByCity({super.key});

  @override
  State<SearchByCity> createState() => _SearchByCityState();
}

class _SearchByCityState extends State<SearchByCity> {
  TextEditingController searchController = TextEditingController();
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.center,
      children: [
        TextfieldWidget(
          controller: searchController,
          label: '',
          hintText: 'Search by city',
          preIcon: const Icon(Icons.search),
          radius: 24,
          height: 40,
        ),
        GradientButtonWidget(
          text: 'Search',
          onPressed: () async {
            bool _notFound = false;
            if (searchController.text != '') {
              final cities = await SupabaseClass().getCitiesInDB();
              for (var city in cities) {
                if (searchController.text == city) {
                  if (context.mounted) {
                    HotelsBasedOnSearch(city: searchController.text)
                        .push(context);
                  }
                } else {
                  _notFound = true;
                }
              }
            }
            if (_notFound) {
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                      'Sorry the ${searchController.text} is not available, but no worries you can found a lot in our app'),
                  backgroundColor: AppColors.primary,
                ));
              }
            }
          },
        ),
        kHSpace128,
      ],
    );
  }
}
