import 'package:flutter/material.dart';
import 'package:hotel_application/components/gradient_button_widget.dart';
import 'package:hotel_application/components/textfield_widget.dart';
import 'package:hotel_application/constants/colors.dart';
import 'package:hotel_application/db_services/services.dart';
import 'package:hotel_application/extension/nav.dart';
import 'package:hotel_application/extension/screen_size.dart';
import 'package:hotel_application/screens/hotels_based_on_search_screen.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key, required this.currentUserEmail});
  final String currentUserEmail;

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

TextEditingController searchController = TextEditingController();

class _SearchBarWidgetState extends State<SearchBarWidget> {
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.hardEdge,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          width: context.getWidth,
          height: context.getHeight / 3.5,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [AppColors.primary, AppColors.secondry])),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FutureBuilder(
                  future: SupabaseClass()
                      .getUserName(userEmail: widget.currentUserEmail),
                  builder: (context, snapshot) {
                    return Expanded(
                        child: Text(
                      'Hello, ${snapshot.data?.name.toString() ?? ''}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      overflow: TextOverflow.clip,
                    ));
                  },
                ),
                Image.asset(
                  'assets/images/1.png',
                  height: 200,
                )
              ],
            ),
          ]),
        ),
        Positioned(
          bottom: 16,
          left: 45,
          right: 45,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextfieldWidget(
                controller: searchController,
                label: '',
                height: 45,
                width: context.getWidth,
                preIcon: const Icon(Icons.search),
                hintText: 'Where do you want to go?',
                radius: 24,
                suffiIcon: Container(
                  margin: const EdgeInsets.all(8),
                  child: GradientButtonWidget(
                    onPressed: () async {
                      bool notFound = false;
                      if (searchController.text != '') {
                        final hotelsNames =
                            await SupabaseClass().getHotelsNamesInDB();
                        for (var name in hotelsNames) {
                          if (searchController.text.contains(name)) {
                            if (context.mounted) {
                              HotelsBasedOnSearch(city: searchController.text)
                                  .push(context);
                            }
                          } else {
                            notFound = true;
                          }
                        }
                        if (notFound) {
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  'Sorry the ${searchController.text} is not available, but no worries you can found a lot in our app'),
                              backgroundColor: AppColors.primary,
                            ));
                          }
                        }
                      }
                    },
                    text: 'Search',
                    width: 55,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
