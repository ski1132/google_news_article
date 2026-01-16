import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' show dotenv;
import 'package:google_news_article/flavors/build_config.dart';
import 'package:google_news_article/flavors/env_config.dart';
import 'package:google_news_article/flavors/environment.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await dotenv.load(fileName: ".env");
  String baseUrl = dotenv.env['baseUrl'] ?? ''; //main ip

  EnvConfig devConfig = EnvConfig(appName: "Google News Dev", baseUrl: baseUrl);

  BuildConfig.instantiate(
    envType: Environment.DEVELOPMENT,
    envConfig: devConfig,
  );
  runApp(const App());
}
