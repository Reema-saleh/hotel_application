import 'package:flutter/material.dart';
import 'package:hotel_application/constants/colors.dart';
import 'package:hotel_application/constants/spaces.dart';

class TextfieldWidget extends StatelessWidget {
  const TextfieldWidget({
    super.key,
    required this.label,
    this.hintText,
    this.preIcon,
    this.suffiIcon,
    this.width = 300,
    this.height = 60,
    this.controller,
  });

  final String label;
  final double width;
  final double height;
  final String? hintText;
  final Icon? preIcon;
  final Icon? suffiIcon;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
              color: AppColors.primary,
              fontSize: 18,
              fontWeight: FontWeight.bold),
          textAlign: TextAlign.start,
        ),
        kHSpace8,
        SizedBox(
          height: height,
          width: width,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
                prefixIcon: preIcon,
                suffixIcon: suffiIcon,
                hintText: hintText,
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primary),
                    borderRadius: BorderRadius.circular(15))),
          ),
        ),
      ],
    );
  }
}
