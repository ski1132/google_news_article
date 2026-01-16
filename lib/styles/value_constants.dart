abstract class ValueConstants {
  static const double widthDefault = 100;
  static const double heightDefault = 100;
  static const double width_50 = 50;
  static const double height_50 = 50;

  static const int loggerLineLength = 120;
  static const int loggerErrorMethodCount = 8;
  static const int loggerMethodCount = 2;

  static RegExp specialCharacter = RegExp(
    r'[!@#\$&*~`%^()_+\-=\[\]{};:"\\|,.<>/?]',
  );
  static RegExp engCharacter = RegExp(r'[A-Za-z]');
  static RegExp uppercaseCharacter = RegExp(r'[A-Z]');
  static RegExp lowercaseCharacter = RegExp(r'[a-z]');
  static RegExp numberCharacter = RegExp(r'[0-9]');
  static RegExp generalInputCharacter = RegExp(
    r'[!@#\$&*~`%^()_+\-=\[\]{};:"\\|,.<>/?A-Za-z0-9]',
  );
}
