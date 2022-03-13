import 'package:anime_hub/data/aired_data.dart';
import 'package:anime_hub/data/broadcast_data.dart';
import 'package:anime_hub/data/genres_data.dart';
import 'package:anime_hub/data/image_data.dart';
import 'package:anime_hub/data/licensors_data.dart';
import 'package:anime_hub/data/producers_data.dart';
import 'package:anime_hub/data/studios_data.dart';
import 'package:anime_hub/data/themes_data.dart';
import 'package:anime_hub/data/trailer_data.dart';

class AllInfoData {
  int id;
  String url;
  ImageData image;
  TrailerData trailer;
  String title;
  String title_english;
  String type;
  String source;
  String status;
  String episodes;
  AiredData aired;
  String duration;
  String rating;
  String score;
  String scored_by;
  String rank;
  String popularity;
  String members;
  String favorites;
  String synopsis;
  String background;
  String season;
  String year;
  BroadcastData broadcast;
  List<ProducersData> producers;
  List<LicensorsData> licensors;
  List<StudiosData> studios;
  List<GenresData> genres;
  List<ThemesData> themes;

  AllInfoData({
    this.id = 0,
    this.url = '',
    required this.image,
    required this.trailer,
    this.title = '',
    this.title_english = '',
    this.type = '',
    this.source = '',
    this.status = '',
    this.episodes = '',
    required this.aired,
    this.duration = '',
    this.rating = '',
    this.score = '',
    this.scored_by = '',
    this.rank = '',
    this.popularity = '',
    this.members = '',
    this.favorites = '',
    this.synopsis = '',
    this.background = '',
    this.season = '',
    this.year = '',
    required this.broadcast,
    required this.producers,
    required this.licensors,
    required this.studios,
    required this.genres,
    required this.themes,
  });
}
