import 'package:anime_hub/providers/providers_top_anime.dart';
import 'package:anime_hub/screens/screen_anime.dart';
import 'package:anime_hub/widgets/anime_tiles.dart';
import 'package:anime_hub/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:jikan_api/jikan_api.dart';
import 'package:provider/provider.dart';

class TopAnimeScreen extends StatelessWidget {
  static const routeName = '/top-anime-screen';
  const TopAnimeScreen({Key? key}) : super(key: key);

  // Future<dynamic> testApi() async {
  //   var jikan = Jikan();
  //   var top = await jikan.getTop(TopType.anime);
  //   print('Top XXXXX: ' + top.length.toString());
  //   // for (int i = 0; i < top.length; i++) {
  //   //   print(top[i].malId.toString());
  //   // }
  //   return top;
  // }

  @override
  Widget build(BuildContext context) {
    final topAnimeProvider = Provider.of<TopAnimeProvider>(context);
    // var topAnime;
    if (topAnimeProvider.getTopAnime.length == 0) {
      // topAnimeProvider.getTopAnimeData();
      topAnimeProvider.topAnimeData();
    }
    List<Top> topAnime = topAnimeProvider.getTopAnime;
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        // ignore: unnecessary_null_comparison
        title: Text('Top ' + topAnime.length.toString() + ' Animes'),
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: topAnime.length,
          itemBuilder: (ctx, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(AnimeScreen.routeName,
                    arguments: topAnime[index].malId);
              },
              child: AnimeTiles(
                animeData: topAnime[index],
              ),
            );
          }),
    );
  }
}
