import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.text,
    required this.buttonAction,
    this.textColor = Colors.white,
    required this.buttonColor,
    this.width = 300,
    this.height = 40,
    this.icon,
  });

  final String text;
  final Function() buttonAction;
  final Color textColor;
  final Color buttonColor;
  final double width;
  final double height;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: buttonAction,
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 16),
        backgroundColor: buttonColor,
        foregroundColor: textColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
            side: const BorderSide(color: Colors.black)),
        fixedSize: Size(width, height),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            icon,
            size: 20,
          ),
          Text(text)
        ],
      ),
    );
  }
}
