import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_news_article/bindings/initial_binding.dart';
import 'package:google_news_article/flavors/build_config.dart';
import 'package:google_news_article/flavors/environment.dart';
import 'package:google_news_article/generated/locale_keys.g.dart';
import 'package:google_news_article/styles/locale_constants.dart';
import 'package:sizer/sizer.dart';

import 'routes/app_pages.dart';
import 'routes/route_history_observer.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  String initialRoute = AppRoutes.home;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // log('==> message didChangeAppLifecycleState: ${state}');
    // if (state == AppLifecycleState.inactive ||
    //     state == AppLifecycleState.paused) return;

    // final isBackground = state == AppLifecycleState.paused;

    // log('==> message didChangeAppLifecycleState: ${state}');

    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: LocaleConstants.supportedLocales,
      path: LocaleConstants.path,
      fallbackLocale: LocaleConstants.enUs.locale,
      child: Sizer(
        builder: (context, orientation, screenType) {
          return GetMaterialApp(
            onGenerateTitle: (BuildContext ctx) => ctx.tr(LocaleKeys.app_name),
            navigatorObservers: [RouteHistoryObserver()],
            debugShowCheckedModeBanner:
                BuildConfig.instance.environment == Environment.DEVELOPMENT,
            initialBinding: InitialBinding(),
            initialRoute: initialRoute,
            getPages: AppPages.routes,
            routingCallback: (value) {},

            /// Localization
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: ThemeData(
              fontFamily: 'NotoSansThai',
              textTheme: const TextTheme(
                displayLarge: TextStyle(fontWeight: FontWeight.w900), // Black
                displayMedium: TextStyle(
                  fontWeight: FontWeight.w800,
                ), // ExtraBold
                displaySmall: TextStyle(fontWeight: FontWeight.w700), // Bold
                headlineMedium: TextStyle(
                  fontWeight: FontWeight.w600,
                ), // SemiBold
                headlineSmall: TextStyle(fontWeight: FontWeight.w500), // Medium
                bodyLarge: TextStyle(fontWeight: FontWeight.w400), // Regular
                bodyMedium: TextStyle(fontWeight: FontWeight.w300), // Light
                bodySmall: TextStyle(fontWeight: FontWeight.w200), // ExtraLight
              ),
              scaffoldBackgroundColor: Colors.white,
              useMaterial3: true,
              brightness: Brightness.light,
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white,
                surfaceTintColor: Colors.white,
              ),
            ),
            builder: EasyLoading.init(),
          );
        },
      ),
    );
  }
}
