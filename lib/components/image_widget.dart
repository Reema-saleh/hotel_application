import 'package:flutter/material.dart';
import 'package:hotel_application/constants/colors.dart';
import 'package:hotel_application/extension/screen_size.dart';
import 'package:cached_network_image/cached_network_image.dart';


class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    required this.path,
  });

  final String path;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: path,
      height: context.getHeight / 4,
      width: context.getWidth / 3,
      fit: BoxFit.cover,
      errorWidget: (context, url, error) => SizedBox(
        height: context.getHeight / 4,
        width: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error,
              color: AppColors.primary,
              size: 40,
            ),
            const Text(
              'Image not found',
            )
          ],
        ),
      ),
    );
  }
}
