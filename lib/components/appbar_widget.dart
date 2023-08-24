import 'package:flutter/material.dart';
import 'package:hotel_application/constants/colors.dart';

appBarWidget(
  String title,
) {
  return AppBar(
    centerTitle: true,
    title: Text(
      title,
      style: const TextStyle(fontSize: 23),
    ),
    backgroundColor: AppColors.primary,
  );
}

appBarWidgetWicon(String title, Icon icon, Function() iconFun) {
  return AppBar(
    centerTitle: true,
    title: Text(
      title,
      style: const TextStyle(fontSize: 23),
    ),
    actions: [IconButton(onPressed: iconFun, icon: icon)],
    backgroundColor: AppColors.primary,
  );
}
