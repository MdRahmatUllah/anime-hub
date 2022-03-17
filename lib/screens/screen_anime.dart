import 'package:anime_hub/providers/providers_anime_data.dart';
import 'package:anime_hub/providers/providers_top_anime.dart';
import 'package:flutter/material.dart';
import 'package:jikan_api/jikan_api.dart';
import 'package:provider/provider.dart';

class AnimeScreen extends StatelessWidget {
  static const routeName = '/anime-screen';
  const AnimeScreen({Key? key}) : super(key: key);

  String multyString(List<GenericInfo> temGen) {
    String res = '';
    for (int i = 0; i < temGen.length; i++) {
      res += temGen[i].name + ', ';
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    final _animeId = ModalRoute.of(context)!.settings.arguments != null
        ? ModalRoute.of(context)!.settings.arguments as int
        : 1;
    Provider.of<TopAnimeProvider>(context, listen: false).fatchTopAnimeInfo();
    final animeInfo =
        Provider.of<TopAnimeProvider>(context).getTopAnimeById(_animeId);
    return Scaffold(
      appBar: AppBar(
        title: Text("Details Information"),
      ),
      body: animeInfo == null
          ? const Center(
              child: Text('Loading...'),
            )
          : Container(
              color: Colors.grey[400],
              child: Column(
                children: [
                  // cover image
                  SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Image.network(
                      animeInfo.imageUrl,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  // anime info
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            Text(
                              animeInfo.title,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Divider(),
                            Container(
                              width: double.infinity,
                              height: 150,
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Text(
                                  animeInfo.synopsis.toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Episodes: ${animeInfo.episodes}',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  'Score: ${animeInfo.score}',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  'Source: ${animeInfo.source}',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Divider(),
                            Text(
                              'Genres: ${multyString(animeInfo.genres.toList())}',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Divider(),
                            Text(
                              'Producers: ${multyString(animeInfo.producers.toList())}',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Divider(),
                            Text(
                              'Studios: ${multyString(animeInfo.studios.toList())}',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Divider(),
                            Text(
                              'Licensors: ${multyString(animeInfo.licensors.toList())}',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Divider(),
                            Text(
                              'Themes: ${multyString(animeInfo.themes.toList())}',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Divider(),
                            Text(
                              'Demographics: ${multyString(animeInfo.demographics.toList())}',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
