import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:jikan_api/jikan_api.dart';

class TopAnimeProvider with ChangeNotifier {
  // Map<String, dynamic> _topAnimeData = {};

  // Map<String, dynamic> get getTopAnime {
  //   print('getGenres');
  //   return _topAnimeData;
  // }

  // int get getTopAnimeLength =>
  //     _topAnimeData['data'] != null ? _topAnimeData['data'].length : 0;

  // Future<void> getTopAnimeData() async {
  //   try {
  //     final String response =
  //         await rootBundle.loadString('assets/json/top_anime.json');
  //     _topAnimeData = await json.decode(response);
  //     // print(_genresData);
  //   } catch (error) {
  //     print(error);
  //   }
  //   notifyListeners();
  // }

  List<Top> _top = [];
  Map<int, Anime> _topAnimeList = {};

  List<Top> get getTopAnime {
    return _top;
  }

  Future<void> topAnimeData() async {
    var jikan = Jikan();
    var top = await jikan.getTop(TopType.anime);
    _top = top.toList();
    notifyListeners();
    fatchTopAnimeInfo();
  }

  Future<void> fatchTopAnimeInfo() async {
    var jikan = Jikan();
    for (int i = 0; i < _top.length; i++) {
      Future.delayed(Duration(microseconds: 400), () {
        var anime = getSingleAnimeInfo(_top[i].malId);
        _topAnimeList[_top[i].malId] = anime as Anime;
        notifyListeners();
      });
    }
    notifyListeners();
  }

  Future<void> getSingleAnimeInfo(int an_id) async {
    var jikan = Jikan();
    Anime? anime;
    if (_topAnimeList[an_id] == null) {
      anime = await jikan.getAnimeInfo(an_id);
      _topAnimeList[an_id] = anime;
    }
    // return anime;
  }

  Anime? getTopAnimeById(int id) {
    var jikan = Jikan();
    if (_topAnimeList[id] != null) {
      return _topAnimeList[id];
    }

    _topAnimeList[id] = getSingleAnimeInfo(id) as Anime;

    return _topAnimeList[id];
  }
}
