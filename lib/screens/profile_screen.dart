import 'package:flutter/material.dart';
import 'package:hotel_application/constants/colors.dart';
import 'package:hotel_application/db_services/services.dart';
import 'package:hotel_application/extension/screen_size.dart';

class Profile extends StatelessWidget {
  Profile({
    super.key,
  });
  final currentUserEmail =
      SupabaseClass.supabase.auth.currentSession?.user.email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
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
              future: SupabaseClass().getUserName(userEmail: currentUserEmail),
              builder: (context, snapshot) {
                return Column(
                  children: [
                    Text(
                      snapshot.data?.name.toString() ?? '',
                      style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      currentUserEmail ?? '',
                      style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.secondry,
          child: Image.asset(
            'assets/images/sign_out.png',
            width: 30,
          ),
          onPressed: () {
            SupabaseClass.supabase.auth.signOut();
          }),
    );
  }
}
