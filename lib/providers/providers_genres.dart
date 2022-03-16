// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class GenresProvider with ChangeNotifier {
  Map<String, dynamic> _genresData = {};

  Map<String, dynamic> get getGenres {
    print('getGenres');
    return _genresData;
  }

  int get getGenresLength =>
      _genresData['data'] != null ? _genresData['data'].length : 0;

  Future<void> getAnimeGeners() async {
    try {
      final String response =
          await rootBundle.loadString('assets/json/anime_genres.json');
      _genresData = await json.decode(response);
      // print(_genresData);
    } catch (error) {
      print(error);
    }
    notifyListeners();
  }
}
