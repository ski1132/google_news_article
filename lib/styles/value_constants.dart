abstract class AppValues {
  static const double padding2 = 2;
  static const double padding4 = 4;
  static const double padding8 = 8;
  static const double padding10 = 10;
  static const double padding12 = 12;
  static const double padding16 = 16;
  static const double padding20 = 20; //default
  static const double padding24 = 24;
  static const double padding28 = 28;
  static const double padding32 = 32;
  static const double padding36 = 36;
  static const double padding40 = 40;
  static const double padding48 = 48;
  static const double padding60 = 60;
  static const double padding80 = 60;

  static const double iconDefaultSize = 24;
  static const double iconSize_10 = 10;
  static const double iconSize_12 = 12;
  static const double iconSize_16 = 16;
  static const double iconSize_18 = 18;
  static const double iconSize_20 = 20;
  static const double iconSize_22 = 22;
  static const double iconSize_28 = 28;
  static const double iconSize_32 = 32;
  static const double iconSize_36 = 36;
  static const double iconSize_40 = 40;
  static const double iconSize_44 = 44;
  static const double iconSize_48 = 48;
  static const double iconSize_60 = 60;

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
