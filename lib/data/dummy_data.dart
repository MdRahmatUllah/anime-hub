import 'package:anime_hub/data/all_info_data.dart';
import 'package:anime_hub/data/image_data.dart';

import 'aired_data.dart';
import 'broadcast_data.dart';
import 'genres_data.dart';
import 'licensors_data.dart';
import 'producers_data.dart';
import 'studios_data.dart';
import 'themes_data.dart';
import 'trailer_data.dart';

class DummyData {
  // int id = 0;
  // String url = "";
  // ImageData image = ImageData();
  // TrailerData trailer = TrailerData();
  // String title = "";
  // String title_english = "";
  // String type = "";
  // String source = "";
  // String status = "";
  // String episodes = "";
  // AiredData aired = AiredData();
  // String duration = "";
  // String rating = "";
  // String score = "";
  // String scored_by = "";
  // String rank = "";
  // String popularity = "";
  // String members = "";
  // String favorites = "";
  // String synopsis = "";
  // String background = "";
  // String season = "";
  // String year = "";
  // BroadcastData broadcast = BroadcastData();
  // List<ProducersData> producers = [];
  // List<LicensorsData> licensors = [];
  // List<StudiosData> studios = [];
  // List<GenresData> genres = [];
  // List<ThemesData> themes = [];

  AllInfoData dummyAllInfoData() {
    return AllInfoData(
      id: 0,
      url: "",
      image: ImageData(),
      trailer: TrailerData(),
      title: "",
      title_english: "",
      type: "",
      source: "",
      status: "",
      episodes: "",
      aired: AiredData(),
      duration: "",
      rating: "",
      score: "",
      scored_by: "",
      rank: "",
      popularity: "",
      members: "",
      favorites: "",
      synopsis: "",
      background: "",
      season: "",
      year: "",
      broadcast: BroadcastData(),
      producers: [],
      licensors: [],
      studios: [],
      genres: [],
      themes: [],
    );
  }
}
