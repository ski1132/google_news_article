import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' show dotenv;
import 'package:google_news_article/app.dart';
import 'package:google_news_article/flavors/build_config.dart';
import 'package:google_news_article/flavors/env_config.dart';
import 'package:google_news_article/flavors/environment.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await initializeDateFormatting('th_TH');

  await dotenv.load(fileName: ".env");
  String baseUrl = dotenv.env['baseUrl'] ?? ''; //main ip
  String host = dotenv.env['host'] ?? '';
  String key = dotenv.env['key'] ?? '';

  EnvConfig prodConfig = EnvConfig(
    appName: "Google News",
    baseUrl: baseUrl,
    host: host,
    key: key,
  );

  BuildConfig.instantiate(
    envType: Environment.PRODUCTION,
    envConfig: prodConfig,
  );
  runApp(const App());
}
