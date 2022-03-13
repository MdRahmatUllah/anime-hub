import 'package:anime_hub/data/all_info_data.dart';
import 'package:flutter/material.dart';

class GenresDetailsScreen extends StatelessWidget {
  static const routeName = '/genres-details-screen';
  const GenresDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final info =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    print("Dynamic Data: " + info.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text(info['name']),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Anime Count in this Genre: ' + info['count'].toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                'For More Information: ' + info['url'],
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
