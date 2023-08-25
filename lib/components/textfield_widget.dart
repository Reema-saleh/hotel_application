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
    this.obscureText = false,
    this.radius,
  });

  final String label;
  final double width;
  final double height;
  final String? hintText;
  final Icon? preIcon;
  final Icon? suffiIcon;
  final TextEditingController? controller;
  final bool obscureText;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
              color: Colors.black54, fontSize: 14, fontWeight: FontWeight.bold),
          textAlign: TextAlign.start,
        ),
        kHSpace8,
        SizedBox(
          height: height,
          width: width,
          child: TextField(
            clipBehavior: Clip.hardEdge,
            obscureText: obscureText,
            controller: controller,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                prefixIcon: preIcon,
                suffixIcon: suffiIcon,
                hintText: hintText,
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.primary),
                    borderRadius: BorderRadius.circular(radius ?? 15))),
          ),
        ),
      ],
    );
  }
}
