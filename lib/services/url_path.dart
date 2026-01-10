import 'package:google_news_article/flavors/build_config.dart';

class UrlPath {
  static final String baseUrl = BuildConfig.instance.config.baseUrl;

  //login
  static final String checkEmailUrl = '$baseUrl/auth/check-email';
  static final String loginUrl = '$baseUrl/auth/login';

  //register
  static final String registerUrl = '$baseUrl/auth/register';

  //home
  static final String bannerListUrl = '$baseUrl/content/banners';
  static final String gameListUrl = '$baseUrl/games';
  static final String gmListUrl = '$baseUrl/games/partner/gm';
  static final String shopListUrl = '$baseUrl/games/partner/shops';

  //booking
  static final String bookingUrl = '$baseUrl/bookings';
}
