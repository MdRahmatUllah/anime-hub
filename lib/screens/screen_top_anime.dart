import 'package:anime_hub/providers/providers_top_anime.dart';
import 'package:anime_hub/screens/screen_anime.dart';
import 'package:anime_hub/widgets/anime_tiles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopAnimeScreen extends StatelessWidget {
  static const routeName = '/top-anime-screen';
  const TopAnimeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final topAnimeProvider = Provider.of<TopAnimeProvider>(context);
    if (topAnimeProvider.getTopAnimeLength == 0) {
      topAnimeProvider.getTopAnimeData();
    }
    List<dynamic> data = topAnimeProvider.getTopAnime['data'];
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Top ' + topAnimeProvider.getTopAnimeLength.toString() + ' Animes'),
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: data.length,
          itemBuilder: (ctx, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(AnimeScreen.routeName, arguments: data[index]);
              },
              child: AnimeTiles(
                animeData: data[index],
              ),
            );
          }),
    );
  }
}
