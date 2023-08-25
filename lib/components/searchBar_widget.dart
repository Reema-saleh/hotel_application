import 'package:flutter/material.dart';
import 'package:hotel_application/components/textfield_widget.dart';
import 'package:hotel_application/constants/colors.dart';
import 'package:hotel_application/db_services/services.dart';
import 'package:hotel_application/extension/screen_size.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key, required this.currentUserEmail});
  final String currentUserEmail;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.hardEdge,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
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
                  future: SupabaseClass().getUserName(userId: currentUserEmail),
                  builder: (context, snapshot) {
                    return Expanded(
                      child: Text(
                        'Hello, ${snapshot.data?.name.toString()}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                        overflow: TextOverflow.clip,
                      ),
                    );
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
        const Positioned(
          bottom: 24,
          left: 45,
          right: 45,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextfieldWidget(
                label: '',
                height: 40,
                preIcon: Icon(Icons.search),
                hintText: 'Search',
                radius: 24,
              ),
            ],
          ),
        )
      ],
    );
  }
}
