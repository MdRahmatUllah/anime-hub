import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:jikan_api/jikan_api.dart';

class TopMangaProvider with ChangeNotifier {
  List<Top> _top = [];
  Map<int, Manga> _topMangaList = {};

  List<Top> get getTopMnaga {
    return _top;
  }

  Future<void> topMangaData() async {
    var jikan = Jikan();
    var top = await jikan.getTop(TopType.manga);
    _top = top.toList();
    notifyListeners();
    fatchTopMangaInfo();
  }

  Future<void> fatchTopMangaInfo() async {
    var jikan = Jikan();
    for (int i = 0; i < _top.length; i++) {
      Future.delayed(Duration(microseconds: 400), () {
        var manga = getSingleMangaInfo(_top[i].malId);
        _topMangaList[_top[i].malId] = manga as Manga;
        notifyListeners();
      });
    }
    notifyListeners();
  }

  Future<void> getSingleMangaInfo(int an_id) async {
    var jikan = Jikan();
    Manga? manga;
    if (_topMangaList[an_id] == null) {
      manga = await jikan.getMangaInfo(an_id);
      _topMangaList[an_id] = manga;
    }
    // return anime;
  }

  Manga? getTopMangaById(int id) {
    var jikan = Jikan();
    if (_topMangaList[id] != null) {
      return _topMangaList[id];
    }

    _topMangaList[id] = getSingleMangaInfo(id) as Manga;

    return _topMangaList[id];
  }
}
