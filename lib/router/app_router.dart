import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:elesafe_app/router/router_observer.dart';
import 'package:elesafe_app/features/map/map_screen.dart';
import 'package:elesafe_app/features/alert/alert_screen.dart';
import 'package:elesafe_app/features/signin/signin_screen.dart';

/// AppRouter is responsible for creating and configuring the app's navigation structure
class AppRouter {
  AppRouter._(); // Private constructor to prevent instantiation

  // Core static route paths
  static const String signInPath = '/signin';
  static const String homePath = '/home';
  static const String alertPath = '/alert';
  static const String mapPath = '/map';
  static const String notFoundPath = '/404';

  /// Creates and returns a GoRouter configured with dynamic routes based on authentication
  static GoRouter createRouter() {

    // Create the ValueNotifier for RoutingConfig
    final routingConfig = ValueNotifier<RoutingConfig>(_generateRoutingConfig());

    return GoRouter.routingConfig(
      routingConfig: routingConfig,
      navigatorKey: GlobalKey<NavigatorState>(),
      observers: <NavigatorObserver>[EleSafeNavigatorObserver()],
      // debugLogDiagnostics: true,
      initialLocation: signInPath,
      onException: (_, GoRouterState state, GoRouter router) => router.push(notFoundPath, extra: state.uri.toString()),
    );
  }

  /// Generates a new routing configuration based on current auth state
  static RoutingConfig _generateRoutingConfig() {
    return RoutingConfig(
      routes: <RouteBase>[
        // Public routes available to all users
        ..._createPublicRoutes(),
      ],
    );
  }

  /// Creates the public routes that don't require authentication
  static List<RouteBase> _createPublicRoutes() {
    return [
      GoRoute(
        path: signInPath,
        name: 'signin',
        builder: (BuildContext context, GoRouterState state) {
          return const SignInScreen();
        },
      ),
      GoRoute(
        path: homePath,
        name: 'home',
        builder: (BuildContext context, GoRouterState state) {
          return const SizedBox();
        },
      ),
      GoRoute(
        path: alertPath,
        name: 'alert',
        builder: (BuildContext context, GoRouterState state) {
          return const AlertScreen();
        },
      ),
      GoRoute(
        path: mapPath,
        name: 'map',
        builder: (BuildContext context, GoRouterState state) {
          return const MapScreen();
        },
      ),
      GoRoute(
        path: notFoundPath,
        name: '404',
        builder: (BuildContext context, GoRouterState state) {
          return NotFoundScreen(uri: state.extra as String? ?? state.uri.toString());
        },
      ),
    ];
  }
}

/// The Not Found Screen
class NotFoundScreen extends StatelessWidget {
  final String uri;

  const NotFoundScreen({super.key, required this.uri});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page Not Found')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('404 - Page Not Found'),
            const SizedBox(height: 16),
            Text('Requested URI: $uri'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.go(AppRouter.homePath),
              child: const Text('Go Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}

/// The Not Authorized Screen
class NotAuthorizedScreen extends StatelessWidget {
  final String uri;

  const NotAuthorizedScreen({super.key, required this.uri});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Not Authorized')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You are not authorized to view this page'),
            const SizedBox(height: 16),
            Text('Requested URI: $uri'),
          ],
        ),
      ),
    );
  }
}
