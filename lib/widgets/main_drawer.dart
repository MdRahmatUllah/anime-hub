import 'package:anime_hub/screens/screen_top_anime.dart';
import 'package:anime_hub/screens/screen_top_manga.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  Icon findIcon(int index) {
    switch (index) {
      case 0:
        return Icon(Icons.home);
      case 1:
        return Icon(Icons.topic);
      case 2:
        return Icon(Icons.animation);
      case 3:
        return Icon(Icons.margin);
      default:
        return Icon(Icons.face);
    }
  }

  String findRouteName(int index) {
    switch (index) {
      case 0:
        return '/';
      case 1:
        return '/';
      case 2:
        return TopAnimeScreen.routeName;
      case 3:
        return TopMangaScreen.routeName;
      default:
        return '/';
    }
  }

  Widget buildDrawerList(BuildContext ctx, String title, int index) {
    return ListTile(
      leading: findIcon(index),
      title: Text(title, style: Theme.of(ctx).textTheme.headline5),
      onTap: () {
        Navigator.of(ctx).pushReplacementNamed(findRouteName(index));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            color: Theme.of(context).primaryColor,
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(30, 60, 0, 0),
            alignment: Alignment.centerLeft,
            child: Text(
              'Menu',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                buildDrawerList(context, 'Home', 0),
                buildDrawerList(context, 'Genres', 1),
                buildDrawerList(context, 'Top Anime', 2),
                buildDrawerList(context, 'Top Manga', 3),
                buildDrawerList(context, 'Top Characters', 4),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
