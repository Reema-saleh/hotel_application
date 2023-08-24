// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:hotel_application/constants/colors.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({super.key, required this.index});
  int index;
  final screens = [];
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
              icon: Icon(Icons.list_alt_sharp), label: 'Reservations'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ]);
  }
}
