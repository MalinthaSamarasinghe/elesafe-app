import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:elesafe_app/utils/const.dart';
import 'package:elesafe_app/router/app_router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class EleSafeApp extends StatefulWidget {
  const EleSafeApp({super.key});

  @override
  State<EleSafeApp> createState() => _EleSafeAppState();
}

class _EleSafeAppState extends State<EleSafeApp> {
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();

    /// Create router once
    _router = AppRouter.createRouter();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      key: const ValueKey('MaterialApp'),
      routerConfig: _router,
      builder: (context, child) {
        child = EasyLoading.init()(context, child);
        return ResponsiveBuilder(
          builder: (context, sizingInformation) {
            if (sizingInformation.deviceScreenType == DeviceScreenType.mobile || sizingInformation.deviceScreenType == DeviceScreenType.watch) {
              SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
            } else {
              SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
            }

            /// Remove the splash screen
            FlutterNativeSplash.remove();
            return ScrollConfiguration(behavior: AppBehavior(), child: child!);
          },
        );
      },
      title: appName,
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue[900]!), useMaterial3: true),
      debugShowCheckedModeBanner: false,
    );
  }
}

/// To remove scroll glow
class AppBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) => child;
}
