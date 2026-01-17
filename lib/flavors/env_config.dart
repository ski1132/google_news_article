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
        // number of method calls to be displayed
        errorMethodCount: ValueConstants.loggerErrorMethodCount,
        // number of method calls if stacktrace is provided
        lineLength: ValueConstants.loggerLineLength,
        // width of the output
        colors: true,
        // Colorful log messages
        printEmojis: true,
        // Print an emoji for each log message
      ),
    );
  }
}
