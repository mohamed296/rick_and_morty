import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'routes_names.dart';
import 'routes_handlers.dart';

/// Global navigator key for [GoRouter].
final globalNavigatorKey = GlobalKey<NavigatorState>();

/// Main router configuration
class RoutesConfig {
  static final GoRouter router = GoRouter(
    navigatorKey: globalNavigatorKey,
    debugLogDiagnostics: true,
    initialLocation: '/characters',
    routes: [
      GoRoute(
          name: RouteNames.charactersScreen,
          path: '/characters',
          builder: charactersScreenHandler,
          routes: [
            GoRoute(
              name: RouteNames.detailsScreen,
              path: '/details',
              builder: characterDetailsScreenHandler,
            ),
            GoRoute(
              name: RouteNames.favoritesScreen,
              path: '/favorites',
              builder: characterFavoriteScreenHandler,
            ),
          ]),
    ],
  );
}
