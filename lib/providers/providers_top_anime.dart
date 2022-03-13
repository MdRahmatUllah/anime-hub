import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class TopAnimeProvider with ChangeNotifier {
  Map<String, dynamic> _topAnimeData = {};

  Map<String, dynamic> get getTopAnime {
    print('getGenres');
    return _topAnimeData;
  }

  int get getTopAnimeLength =>
      _topAnimeData['data'] != null ? _topAnimeData['data'].length : 0;

  Future<void> getTopAnimeData() async {
    try {
      final String response =
          await rootBundle.loadString('assets/json/top_anime.json');
      _topAnimeData = await json.decode(response);
      // print(_genresData);
    } catch (error) {
      print(error);
    }
    notifyListeners();
  }
}
