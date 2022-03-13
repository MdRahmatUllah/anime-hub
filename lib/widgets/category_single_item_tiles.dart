import 'package:flutter/material.dart';

class CategorySingleItemTiles extends StatelessWidget {
  final String categoryTitle;
  final int categoryId;
  final String categoryImage;
  final double height;
  const CategorySingleItemTiles(
      {Key? key,
      required this.categoryTitle,
      required this.categoryId,
      this.categoryImage = '',
      this.height = 100})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        child: Column(
          children: [
            Image.network(
              categoryImage,
              height: height * .37,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FittedBox(
                child: Text(
                  categoryTitle,
                  overflow: TextOverflow.clip,
                  maxLines: 2,
                  softWrap: true,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
      // color: Colors.amber,
    );
  }
}
