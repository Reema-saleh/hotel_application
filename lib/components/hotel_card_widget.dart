import 'package:flutter/material.dart';
import 'package:hotel_application/components/image_widget.dart';

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
          child: ImageWidget(path: path),
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
