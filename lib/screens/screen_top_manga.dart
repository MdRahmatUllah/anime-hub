import 'package:anime_hub/providers/providers_top_manga.dart';
import 'package:anime_hub/screens/screen_anime.dart';
import 'package:anime_hub/widgets/anime_tiles.dart';
import 'package:anime_hub/widgets/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:jikan_api/jikan_api.dart';
import 'package:provider/provider.dart';

class TopMangaScreen extends StatelessWidget {
  static const routeName = '/top-manga-screen';
  const TopMangaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final topMangaProvider = Provider.of<TopMangaProvider>(context);
    // var topManga;
    if (topMangaProvider.getTopMnaga.length == 0) {
      // topMangaProvider.getTopMangaData();
      topMangaProvider.topMangaData();
    }
    List<Top> topManga = topMangaProvider.getTopMnaga;
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        // ignore: unnecessary_null_comparison
        title: Text('Top ' + topManga.length.toString() + ' Mangas'),
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: topManga.length,
          itemBuilder: (ctx, index) {
            return GestureDetector(
              onTap: () {
                // Navigator.of(context).pushNamed(AnimeScreen.routeName,
                //     arguments: topManga[index].malId);
              },
              child: AnimeTiles(
                animeData: topManga[index],
              ),
            );
          }),
    );
  }
}
