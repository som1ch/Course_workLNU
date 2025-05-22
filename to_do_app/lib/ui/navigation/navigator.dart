import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_app/data_source/local_data_source.dart';

final class NavigationService {
  NavigationService(this.authService);

  final LocalDataSource authService;

  GoRouter get router {
    final navigatorKey = GlobalKey<NavigatorState>();

    return GoRouter(
      navigatorKey: navigatorKey,
      initialLocation: PathConstants.intro,
      routes: <RouteBase>[
        GoRoute(
          path: PathConstants.intro,
          builder: (context, state) {
            return IntroScreen.create();
          },
        ),
        GoRoute(
          path: PathConstants.auth,
          builder: (context, state) {
            return AuthScreen.create();
          },
          redirect: (context, state) async {
            if (await authService.refreshToken) {
              return PathConstants.mainScreen;
            }
            return null;
          },
        ),
        GoRoute(
          path: PathConstants.mainScreen,
          builder: (context, state) {
            return DashboardScreen.create();
          },
        ),
      ],
    );
  }
}
