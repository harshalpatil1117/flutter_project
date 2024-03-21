part of 'theme.dart';

@immutable
class EnalyticsColors extends ThemeExtension<EnalyticsColors> {
  const EnalyticsColors({
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
    required this.surface,
    required this.onSurface,
    required this.background,
    required this.onBackground,
    required this.border,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.success,
    required this.onSuccess,
    required this.successContainer,
    required this.onSuccessContainer,
  });

  final Color primary;
  final Color onPrimary;
  final Color secondary;
  final Color onSecondary;
  final Color surface;
  final Color onSurface;
  final Color background;
  final Color onBackground;
  final Color border;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color success;
  final Color onSuccess;
  final Color successContainer;
  final Color onSuccessContainer;

  @override
  EnalyticsColors copyWith({
    Color? primary,
    Color? onPrimary,
    Color? secondary,
    Color? onSecondary,
    Color? surface,
    Color? onSurface,
    Color? background,
    Color? onBackground,
    Color? border,
    Color? error,
    Color? onError,
    Color? errorContainer,
    Color? onErrorContainer,
    Color? success,
    Color? onSuccess,
    Color? successContainer,
    Color? onSuccessContainer,
  }) {
    return EnalyticsColors(
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      secondary: secondary ?? this.secondary,
      onSecondary: onSecondary ?? this.onSecondary,
      surface: surface ?? this.surface,
      onSurface: onSurface ?? this.onSurface,
      background: background ?? this.background,
      onBackground: onBackground ?? this.onBackground,
      border: border ?? this.border,
      error: error ?? this.error,
      onError: onError ?? this.onError,
      errorContainer: errorContainer ?? this.errorContainer,
      onErrorContainer: onErrorContainer ?? this.onErrorContainer,
      success: success ?? this.success,
      onSuccess: onSuccess ?? this.onSuccess,
      successContainer: successContainer ?? this.successContainer,
      onSuccessContainer: onSuccessContainer ?? this.onSuccessContainer,
    );
  }

  @override
  ThemeExtension<EnalyticsColors> lerp(
      ThemeExtension<EnalyticsColors>? other, double t) {
    if (other is! EnalyticsColors) {
      return this;
    }
    return EnalyticsColors(
      primary: Color.lerp(primary, other.primary, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      onSecondary: Color.lerp(onSecondary, other.onSecondary, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
      background: Color.lerp(background, other.background, t)!,
      onBackground: Color.lerp(onBackground, other.onBackground, t)!,
      border: Color.lerp(border, other.border, t)!,
      error: Color.lerp(error, other.error, t)!,
      onError: Color.lerp(onError, other.onError, t)!,
      errorContainer: Color.lerp(errorContainer, other.errorContainer, t)!,
      onErrorContainer:
          Color.lerp(onErrorContainer, other.onErrorContainer, t)!,
      success: Color.lerp(success, other.success, t)!,
      onSuccess: Color.lerp(onSuccess, other.onSuccess, t)!,
      successContainer:
          Color.lerp(successContainer, other.successContainer, t)!,
      onSuccessContainer:
          Color.lerp(onSuccessContainer, other.onSuccessContainer, t)!,
    );
  }

}

EnalyticsColors enalyticsColorsExtensions = const EnalyticsColors(
  primary: Color(0xff36C6CD),
  onPrimary: Color(0xffFFFFFF),
  secondary: Color(0xff57cc71),
  onSecondary: Color(0xffFFFFFF),
  surface: Color(0xfff5f5f5),
  onSurface: Color(0xff000000),
  background: Color(0xffFFFFFF),
  onBackground: Color(0xff000000),
  border: Color(0xffD9D9D9),
  error: Color(0xff880808),
  onError: Color(0xffFFFFFF),
  errorContainer: Color(0xffF9DEDC),
  onErrorContainer: Color(0xff410E0B),
  success: Color(0xff0B920B),
  onSuccess: Color(0xffFFFFFF),
  successContainer: Color(0xffB3EAB3),
  onSuccessContainer: Color(0xff008b00),
);

extension EnalyticsColorsExtensions on ThemeData {
  EnalyticsColors get enalyticsColorsExtensions => extension<EnalyticsColors>()!;
}
