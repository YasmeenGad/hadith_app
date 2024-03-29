import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hadith/view/screens/home_view.dart';
import 'package:hadith/view/screens/splash_view.dart';

class RoutesApp {
  static const String homeView = '/homeView';
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
    ],
  );
}
