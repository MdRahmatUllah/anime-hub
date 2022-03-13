// ignore_for_file: prefer_const_constructors

import 'package:anime_hub/providers/providers_genres.dart';
import 'package:anime_hub/universal_data/ui_size_data.dart';
import 'package:anime_hub/widgets/genres_tiles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screen_genres_details.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var workingAreaHeight = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).padding.top +
            MediaQuery.of(context).padding.bottom +
            AppBar().preferredSize.height);
    final genProvider = Provider.of<GenresProvider>(context);
    if (genProvider.getGenresLength == 0) {
      genProvider.getAnimeGeners();
    }

    final genersData = genProvider.getGenres;
    return Scaffold(
      appBar: AppBar(
        title: Text('Anime Hub'),
      ),
      body: Column(
        children: [
          Provider.of<GenresProvider>(context).getGenresLength == 0
              ? Container(
                  height: workingAreaHeight * 0.27,
                  width: double.infinity,
                  child: const Center(child: Text("Loading...")),
                )
              : Container(
                  height: workingAreaHeight,
                  child: GridView.builder(
                    itemCount: genProvider.getGenresLength,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (ctx, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                              GenresDetailsScreen.routeName,
                              arguments: genersData['data'][index]);
                        },
                        child: GenresTiles(
                          mal_Id: genersData['data'][index]['mal_id'],
                          name: genersData['data'][index]['name'],
                          url: genersData['data'][index]['url'],
                          count: genersData['data'][index]['count'],
                        ),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
