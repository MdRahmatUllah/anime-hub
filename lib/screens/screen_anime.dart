import 'package:flutter/material.dart';

class AnimeScreen extends StatelessWidget {
  static const routeName = '/anime-screen';
  const AnimeScreen({Key? key}) : super(key: key);

  String multyString(dynamic temGen) {
    String res = '';
    for (int i = 0; i < temGen.length; i++) {
      res += temGen[i]['name'] + ', ';
    }
    return res;
  }

  @override
  Widget build(BuildContext context) {
    final _anime =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: Text(_anime['title']),
      ),
      body: Container(
        color: Colors.grey[400],
        child: Column(
          children: [
            // cover image
            SizedBox(
              height: 200,
              width: double.infinity,
              child: Image.network(
                _anime['images']['jpg']['image_url'],
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
                        _anime['title'],
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
                            _anime['synopsis'],
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
                            'Episodes: ${_anime['episodes']}',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'Score: ${_anime['score']}',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'Source: ${_anime['source']}',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      Text(
                        'Genres: ${multyString(_anime['genres'])}',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Divider(),
                      Text(
                        'Producers: ${multyString(_anime['producers'])}',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Divider(),
                      Text(
                        'Studios: ${multyString(_anime['studios'])}',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Divider(),
                      Text(
                        'Licensors: ${multyString(_anime['licensors'])}',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Divider(),
                      Text(
                        'Themes: ${multyString(_anime['themes'])}',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Divider(),
                      Text(
                        'Demographics: ${multyString(_anime['demographics'])}',
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
