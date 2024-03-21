part of 'theme.dart';

abstract class _EcommerceColors {
  static const Color red = Color(0xffFF4747);
  static const Color grey = Color(0xff797979);
  static const Color black = Color(0xff242424);
  static const Color white = Color(0xfff6f6f6);

  static const Color successGreen = Color(0xff0CCA6F);
  static const Color darkred = Color(0xffDB0F27);

  static const Color background = Color(0xfff5f5f5);

  static const Color border = Color(0xffD9D9D9);
  static const Color divider = Color(0xffB3B3B3);
  static const Color transparent = Color(0x00000000);

}

const _colorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: _EcommerceColors.red,
  onPrimary: _EcommerceColors.white,
  secondary: _EcommerceColors.grey,
  onSecondary: _EcommerceColors.white,
  tertiaryContainer: _EcommerceColors.background,
  onTertiaryContainer: _EcommerceColors.background,
  error: _EcommerceColors.darkred,
  onError: _EcommerceColors.white,
  background: _EcommerceColors.white,
  onBackground: _EcommerceColors.black,
  surface: _EcommerceColors.white,
  onSurface: _EcommerceColors.black,
);
