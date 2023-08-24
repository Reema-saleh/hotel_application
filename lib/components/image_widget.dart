import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget(
      {super.key,
      required this.imgPath,
      this.isNetwork = true,
      this.imgWidth,
      this.imgHeight});
  final String imgPath;
  final bool isNetwork;
  final double? imgWidth;
  final double? imgHeight;

  @override
  Widget build(BuildContext context) {
    return isNetwork
        ? Image.network(
            imgPath,
            width: imgWidth,
            height: imgHeight,
            errorBuilder: (context, error, stackTrace) {
              return Icon(
                Icons.error_outline_rounded,
                size: imgHeight,
              );
            },
          )
        : Image.asset(
            imgPath,
            width: imgWidth,
            height: imgHeight,
            errorBuilder: (context, error, stackTrace) {
              return Icon(
                Icons.error_outline_rounded,
                size: imgHeight,
              );
            },
          );
  }
}
