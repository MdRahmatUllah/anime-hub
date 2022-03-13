import 'package:anime_hub/screens/screen_genres_details.dart';
import 'package:anime_hub/screens/screen_category.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/providers_genres.dart';
import 'screens/screen_start.dart';
import 'universal_data/ui_size_data.dart';

void main(List<String> args) {
  runApp(MainApp());
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
        routes: {
          CategoryScreen.routeName: (ctx) => const CategoryScreen(),
          GenresDetailsScreen.routeName: (ctx) => const GenresDetailsScreen(),
        },
      ),
    );
  }
}
