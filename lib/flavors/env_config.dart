import 'package:google_news_article/styles/value_constants.dart';
import 'package:logger/logger.dart';

class EnvConfig {
  final String appName;
  final String baseUrl;
  final String host;
  final String key;

  late final Logger logger;

  EnvConfig({
    required this.appName,
    required this.baseUrl,
    required this.host,
    required this.key,
  }) {
    logger = Logger(
      printer: PrettyPrinter(
        methodCount: ValueConstants.loggerMethodCount,
        errorMethodCount: ValueConstants.loggerErrorMethodCount,
        lineLength: ValueConstants.loggerLineLength,
        colors: true,
        printEmojis: true,
      ),
    );
  }
}
