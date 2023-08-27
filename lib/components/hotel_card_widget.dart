import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hotel_application/constants/colors.dart';
import 'package:hotel_application/extension/screen_size.dart';

class HotelCard extends StatelessWidget {
  const HotelCard({
    super.key,
    required this.path,
    required this.title,
    required this.subtitle1,
    required this.price,
  });
  final String path;
  final String title;
  final String subtitle1;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: CachedNetworkImage(
            imageUrl: path,
            height: context.getHeight / 4,
            width: context.getWidth / 2.5,
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
          ),
        ),
        SizedBox(
          width: 140,
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                overflow: TextOverflow.ellipsis),
          ),
        ),
        SizedBox(
          width: 140,
          child: Text(
            subtitle1,
            style: const TextStyle(
                color: Colors.black54, overflow: TextOverflow.ellipsis),
          ),
        ),
        Row(
          children: [
            Text(
              '$price\$',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text(
              '/night',
              style: TextStyle(color: Colors.black54),
            ),
          ],
        )
      ],
    );
  }
}