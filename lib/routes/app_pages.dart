import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = AppRoutes.emailLogin;
  static const defaultTransition = Transition.rightToLeft;

  static final List<GetPage> routes = [
    // GetPage(
    //   name: _Paths.bookingDetail,
    //   page: () => BookingDetailPage(),
    //   binding: BookingDetailBinding(),
    //   transition: defaultTransition,
    // ),
  ];
}
