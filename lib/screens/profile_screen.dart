import 'package:flutter/material.dart';
import 'package:hotel_application/constants/colors.dart';
import 'package:hotel_application/db_services/services.dart';
import 'package:hotel_application/extension/screen_size.dart';

class Profile extends StatelessWidget {
  Profile({
    super.key,
  });
  final currentUserId = SupabaseClass.supabase.auth.currentSession?.user.id;
  final currentUserEmail =
      SupabaseClass.supabase.auth.currentSession?.user.email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                width: context.getWidth,
                height: context.getHeight / 3.5,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [AppColors.primary, AppColors.secondry])),
              ),
              FutureBuilder(
                future: SupabaseClass().getUserName(userId: currentUserId),
                builder: (context, snapshot) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "User Name: ${snapshot.data?.name.toString() ?? ''}",
                          style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "User Email: ${currentUserEmail ?? ''}",
                          style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: TextButton(
              onPressed: () {
                SupabaseClass.supabase.auth.signOut();
              },
              child: const Text(
                'Sign out',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 16,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
