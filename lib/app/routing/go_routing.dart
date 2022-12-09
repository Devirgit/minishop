import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:minishop/app/routing/route_config.dart';

class Routing {
  Routing();

  final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'root');

  late GoRouter router;

  GoRouter initRouter([String? initPath]) {
    router = GoRouter(
        navigatorKey: _rootNavigatorKey,
        routes: [
          GoRoute(
              path: '/',
              pageBuilder: (context, state) => RoutePageConfig.homePage,
              routes: [
                GoRoute(
                  path: 'cart',
                  pageBuilder: (context, state) => RoutePageConfig.cartPage,
                ),
                GoRoute(
                  path: 'product',
                  pageBuilder: (context, state) {
                    final productID =
                        int.tryParse(state.queryParams['id'] ?? '');
                    if (productID == null) {
                      return RoutePageConfig.notFoundPage;
                    }
                    return RoutePageConfig.productPage(productID);
                  },
                ),
              ]),
        ],
        errorPageBuilder: (context, state) => RoutePageConfig.notFoundPage,
        initialLocation: initPath);
    return router;
  }
}
