import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class GenresTiles extends StatelessWidget {
  final String name;
  final int mal_Id;
  final String url;
  final int count;
  final defaultImage = 'assets/images/';
  const GenresTiles({
    Key? key,
    required this.mal_Id,
    required this.name,
    this.url = '',
    this.count = 0,
  }) : super(key: key);
  int randomNumberGen() {
    return Random().nextInt(100) % 4 + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          image: DecorationImage(
            image: AssetImage(
                'assets/images/sample_image_${randomNumberGen()}.jpg'),
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: Image.asset(
                        'assets/images/sample_image_${randomNumberGen()}.jpg')
                    .image,
              ),
              title: Text(
                name,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Count: $count'),
            ),
          ),
        ),
      ),
    );
  }
}
