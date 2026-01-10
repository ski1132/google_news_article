# This project use Flutter version 3.29.0 ,Dart version 3.7.0

# Before run project every time, run command like this
# 1.flutter clean
# 2.flutter pub get
# 3.flutter pub run build_runner build --delete-conflicting-outputs
# 4.flutter pub run easy_localization:generate -S assets/translations -f keys -o locale_keys.g.dart

# Run project like this
# flutter run -t lib/main_prod.dart --flavor prod
# flutter run -t lib/main_dev.dart --flavor dev
#
# The project is structured as follows:
# 
# lib
# │   main.dart   
# └───ui
# │   └───controller
# │       │   example_view_model.dart
# │   └───get
# │       └───binding
# │       │   get_example_screen.dart
# │   └───post
# │       └───binding
# │       │   post_example_screen.dart
# └───remote
# │   └───api
# │       │   api_endpoints.dart
# │       │   http_manager.dart
# │   └───model
# │       │   base_model.dart
# │       │   base_model.g.dart
# │   └───repository
# │       │   app_repository.dart
# │       │   app_repository_impl.dart
# │   └───response
# │       │   api_response.dart
# │       │   api_response.freezed.dart
# │       │   ...
# └───router
# │       │   screen_controller.dart
# │       │   screen_name.dart
