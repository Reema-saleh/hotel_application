import 'package:flutter/material.dart';
import 'package:hotel_application/constants/spaces.dart';
import 'package:hotel_application/extension/screen_size.dart';
import 'package:hotel_application/models/review.dart';

class Reviews extends StatelessWidget {
  const Reviews({
    super.key,
    required this.reviewList,
  });
  final List<Review> reviewList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: reviewList.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Row(children: [
                const Text('Name',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey, fontSize: 17),),
                kWSpace16,
                const Icon(Icons.star,color:Colors.yellow),
                kWSpace24,
                Text(reviewList[index].rating.toString())
              ],),
              kHSpace16,
              SizedBox(width: context.getWidth - 100 ,
              child: Text('"${reviewList[index].commit}"',overflow: TextOverflow.clip,))
            ],
          );
        });
  }
}
