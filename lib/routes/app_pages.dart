import 'package:flutter/material.dart';


import '../view/boottom_navigation_bar/bottom_navigation_bar.dart';
import '../view/home/home_screen.dart';
import '../view/podcast_playing/podcast_playing_screen.dart';
import 'app_routes.dart';

class AppPages {
  static const initialRoute = Routes.homeMainScreenRoute;
  static Map<String, WidgetBuilder> routes = {
    Routes.homeMainScreenRoute: (context) => const HomeMainScreen(),
    Routes.homeScreenRoute: (context) => const HomeScreen(),
    Routes.podcastPlayingScreenRoute: (context) => const PodcastPlayingScreen(),

    // Routes.introRoute: (context) => const IntroScreen(),

  };

}
