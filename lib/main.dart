import 'package:anime_hub/providers/providers_top_anime.dart';
import 'package:anime_hub/providers/providers_top_manga.dart';
import 'package:anime_hub/screens/screen_anime.dart';
import 'package:anime_hub/screens/screen_genres_details.dart';
import 'package:anime_hub/screens/screen_category.dart';
import 'package:anime_hub/screens/screen_top_manga.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'providers/providers_anime_data.dart';
import 'providers/providers_genres.dart';
import 'screens/screen_start.dart';
import 'screens/screen_top_anime.dart';
import 'universal_data/ui_size_data.dart';
import 'widgets/cover_slide_show.dart';

void main(List<String> args) {
  // set app orientation to portrait only
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MainApp());
  });
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => GenresProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => TopAnimeProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => AnimeProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => TopMangaProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Anime Hub',
        theme: ThemeData(
          colorScheme: ColorScheme.light(
            primary: Colors.blue,
            onPrimary: Colors.white,
            secondary: Colors.blue,
            onSecondary: Colors.white,
            surface: Colors.white,
            onSurface: Colors.black,
            background: Colors.white,
            onBackground: Colors.black,
            error: Colors.red,
            onError: Colors.white,
            brightness: Brightness.light,
          ),
        ),
        home: StartPage(),
        // home: CoverSlideShow(),
        routes: {
          CategoryScreen.routeName: (ctx) => const CategoryScreen(),
          GenresDetailsScreen.routeName: (ctx) => const GenresDetailsScreen(),
          TopAnimeScreen.routeName: (ctx) => const TopAnimeScreen(),
          AnimeScreen.routeName: (ctx) => const AnimeScreen(),
          TopMangaScreen.routeName: (ctx) => const TopMangaScreen(),
        },
      ),
    );
  }
}
