import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:elesafe_app/elesafe_app.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:elesafe_app/core/other/config_easy_loader.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

      FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

      await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

      // ignore: prefer_const_constructors
      setUrlStrategy(PathUrlStrategy());

      /// Set theme for EasyLoader indicator
      ConfigEasyLoader.darkTheme();

      GoRouter.optionURLReflectsImperativeAPIs = true;

      runApp(const EleSafeApp());
    },
    (error, stack) {
      debugPrint('runZonedGuarded: Caught error in my root zone. $error | stack $stack');
    },
  );
}
