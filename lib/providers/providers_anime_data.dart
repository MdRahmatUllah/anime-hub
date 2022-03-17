import 'package:flutter/cupertino.dart';
import 'package:jikan_api/jikan_api.dart';

class AnimeProvider with ChangeNotifier {
  late Anime? _animeInfo;
  Anime? get getAnimeInfo {
    return _animeInfo == null ? null : _animeInfo;
  }

  void clearAnimeInfo() {
    _animeInfo = null;
    notifyListeners();
  }

  Future<void> getAnimeData(int an_id) async {
    var jikan = Jikan();
    var animeInfo = await jikan.getAnimeInfo(an_id);
    _animeInfo = animeInfo;
    // print(_animeInfo.genres);
    // Future.delayed(Duration(seconds: 1), () {
    //   notifyListeners();
    // });
    notifyListeners();
  }
}
