import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class CoverSlideShow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ImageSlideshow(
        width: double.infinity,
        height: 200,
        initialPage: 0,
        indicatorColor: Colors.blue,
        indicatorBackgroundColor: Colors.grey,
        onPageChanged: (value) {
          debugPrint('Page changed: $value');
        },
        autoPlayInterval: 2000,
        isLoop: true,
        children: [
          Image.asset(
            'assets/images/sample_image_1.jpg',
            fit: BoxFit.cover,
          ),
          Image.asset(
            'assets/images/sample_image_2.jpg',
            fit: BoxFit.cover,
          ),
          Image.asset(
            'assets/images/sample_image_3.jpg',
            fit: BoxFit.cover,
          ),
          Image.asset(
            'assets/images/sample_image_4.jpg',
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
