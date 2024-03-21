part of 'theme.dart';

abstract class _EnalyticsColors {
  static const Color darkGreen = Color(0xff36C6CD);
  static const Color lightGreen = Color(0xff57cc71);
  static const Color black = Color(0xff000000);
  static const Color white = Color(0xffFFFFFF);

  static const Color successGreen = Color(0xff0CCA6F);
  static const Color red = Color(0xffDB0F27);

  static const Color background = Color(0xfff5f5f5);

  static const Color border = Color(0xffD9D9D9);
  static const Color divider = Color(0xffB3B3B3);
  static const Color transparent = Color(0x00000000);

}

const _colorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: _EnalyticsColors.darkGreen,
  onPrimary: _EnalyticsColors.white,
  secondary: _EnalyticsColors.lightGreen,
  onSecondary: _EnalyticsColors.white,
  tertiaryContainer: _EnalyticsColors.background,
  onTertiaryContainer: _EnalyticsColors.background,
  error: _EnalyticsColors.red,
  onError: _EnalyticsColors.white,
  background: _EnalyticsColors.white,
  onBackground: _EnalyticsColors.black,
  surface: _EnalyticsColors.white,
  onSurface: _EnalyticsColors.black,
);
