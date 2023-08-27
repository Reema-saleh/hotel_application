import 'package:flutter/material.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';
import 'package:hotel_application/constants/colors.dart';

appBarWidget(
  String title,
) {
  return GradientAppBar(
     gradient: LinearGradient(colors: [AppColors.primary,AppColors.secondry]),
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(fontSize: 23),
      ),    
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
