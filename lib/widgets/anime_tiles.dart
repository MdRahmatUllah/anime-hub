import 'dart:ui';

import 'package:flutter/material.dart';

class AnimeTiles extends StatelessWidget {
  final animeData;

  const AnimeTiles({Key? key, required this.animeData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          image: DecorationImage(
            image: NetworkImage(animeData['images']['jpg']['image_url']),
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
                backgroundImage:
                    Image.network(animeData['images']['jpg']['image_url'])
                        .image,
              ),
              title: Text(
                animeData['title'],
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(animeData['status']),
            ),
          ),
        ),
      ),
    );
  }
}
