import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hadith/view/screens/audio_hadith_view.dart';
import 'package:hadith/view/screens/hadith_view.dart';
import 'package:hadith/view/screens/hadith_details.dart';
import 'package:hadith/view/screens/home_view.dart';
import 'package:hadith/view/screens/saved_hadith_view.dart';
import 'package:hadith/view/screens/splash_view.dart';

class RoutesApp {
  static const String homeView = '/homeView';
  static const String hadithView = '/hadithView';
  static const String audioHadithView = '/audioHadithView';
  static const String hadithDetails = '/hadithDetails';
  static const String savedHadithView = '/savedHadithView';
  static GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: homeView,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeView();
        },
      ),
      GoRoute(
        path: hadithView,
        builder: (BuildContext context, GoRouterState state) {
          return const HadithView();
        },
      ),
      GoRoute(
        path: audioHadithView,
        builder: (BuildContext context, GoRouterState state) {
          return const AudioHadithView();
        },
      ),
      GoRoute(
        path: hadithDetails,
        builder: (BuildContext context, GoRouterState state) {
          return const HadithDetails();
        },
      ),
      GoRoute(
        path: savedHadithView,
        builder: (BuildContext context, GoRouterState state) {
          return const SavedHadithView();
        },
      ),
    ],
  );
}
