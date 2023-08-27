// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hotel_application/constants/colors.dart';
import 'package:hotel_application/screens/home_screen.dart';
import 'package:hotel_application/screens/profile_screen.dart';
import 'package:hotel_application/utilitis/helpers.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({super.key, required this.index});
  int index;
  final screens = [
    const Home(),
    getFutureWidget(),
    Profile()
  ];
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        showUnselectedLabels: true,
        unselectedItemColor: AppColors.primary,
        currentIndex: widget.index,
        onTap: (value) {
          setState(() {
            widget.index = value;
          });
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: ((context) => widget.screens[widget.index])),
              (route) => false);
        },
        selectedItemColor: AppColors.secondry,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.list_alt_sharp), label: 'My Bookings'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ]);
  }
}
