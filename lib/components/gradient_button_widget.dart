import 'package:flutter/material.dart';
import 'package:gradient_coloured_buttons/gradient_coloured_buttons.dart';
import 'package:hotel_application/constants/colors.dart';
import 'package:hotel_application/extension/screen_size.dart';

class GradientButtonWidget extends StatelessWidget {
  const GradientButtonWidget(
      {super.key,
      required this.text,
      required this.onPressed,
      this.width,
      this.height});
  final String text;
  final Function() onPressed;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return GradientButton(
        text: text,
        textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        gradientColors: [AppColors.primary, AppColors.secondry],
        width: width ?? context.getWidth - 100,
        height: height ?? 40,
        borderRadius: 30.0,
        onPressed: onPressed);
  }
}
