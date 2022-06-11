import 'package:flutter/material.dart';
import 'package:flutter_base_template/screens/animate_view.dart';
import 'package:flutter_base_template/screens/guide_view.dart';
import 'package:go_router/go_router.dart';
import '../screens/root_view.dart';
import '../screens/home_view.dart';
import 'app_routes.dart';

class AppPages {
  static const inital = Routes.root;
  static final GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: Routes.guide,
        builder: (BuildContext context, GoRouterState state) =>
            const GuideView(),
      ),
      GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) =>
              const RootView(),
          routes: [
            GoRoute(
              path: 'animate',
              builder: (BuildContext context, GoRouterState state) =>
                  const AnimateView(),
            ),
          ]),
      GoRoute(
        path: Routes.home,
        builder: (BuildContext context, GoRouterState state) =>
            const HomeView(),
      ),
    ],
  );
}
