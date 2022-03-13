import 'package:anime_hub/data/aired_data.dart';
import 'package:anime_hub/data/all_info_data.dart';
import 'package:anime_hub/data/broadcast_data.dart';
import 'package:anime_hub/data/dummy_data.dart';
import 'package:anime_hub/data/genres_data.dart';
import 'package:anime_hub/data/image_data.dart';
import 'package:anime_hub/data/licensors_data.dart';
import 'package:anime_hub/data/producers_data.dart';
import 'package:anime_hub/data/studios_data.dart';
import 'package:anime_hub/data/themes_data.dart';
import 'package:anime_hub/data/trailer_data.dart';

class DataProcessing {
  AllInfoData processData(Map<String, dynamic> jsonData) {
    AllInfoData res = DummyData().dummyAllInfoData();
    // print(jsonData);
    res.id = jsonData['mal_id'] ?? 0;
    res.url = jsonData['url'] ?? "";
    ImageData img = ImageData(image_url: jsonData['images']['jpg']['image_url']
        // small_image_url: jsonData['image']['jpg']['small_image_url'],
        // large_image_url: jsonData['image']['jpg']['large_image_url'],
        );
    res.image = img;
    res.trailer = TrailerData();
    res.title = jsonData['title'] ?? "";
    res.title_english = jsonData['title_english'] ?? "";
    res.type = jsonData['type'] ?? "";
    res.source = jsonData['source'] ?? "";
    res.episodes = jsonData['episodes'].toString();
    res.status = jsonData['status'] ?? "";
    res.aired = AiredData();
    res.duration = jsonData['duration'] ?? "";
    res.rating = jsonData['rating'].toString();
    res.score = jsonData['score'].toString();
    res.scored_by = jsonData['scored_by'].toString();
    res.rank = jsonData['rank'].toString();
    res.popularity = jsonData['popularity'].toString();
    res.members = jsonData['members'].toString();
    res.favorites = jsonData['favorites'].toString();
    res.synopsis = jsonData['synopsis'] ?? "";
    res.background = jsonData['background'] ?? "";
    res.season = jsonData['season'] ?? "";
    res.year = jsonData['year'].toString();
    res.broadcast = BroadcastData();
    res.producers.add(ProducersData());
    res.genres.add(GenresData());
    res.licensors.add(LicensorsData());
    res.studios.add(StudiosData());
    res.themes.add(ThemesData());
    return res;
  }
}
