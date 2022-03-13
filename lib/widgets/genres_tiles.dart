import 'package:flutter/material.dart';

class GenresTiles extends StatelessWidget {
  final String name;
  final int mal_Id;
  final String url;
  final int count;
  final defaultImage = 'assets/images/sample.jpg';
  const GenresTiles({
    Key? key,
    required this.mal_Id,
    required this.name,
    this.url = '',
    this.count = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: Image.asset(defaultImage).image,
        ),
        title: Text(name),
        subtitle: Text('$count Animes'),
        // onTap: () {},
      ),
    );
  }
}
