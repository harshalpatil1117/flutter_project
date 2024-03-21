part of 'theme.dart';

final _elevatedButton = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    elevation: 2,
    padding: EdgeInsets.symmetric(vertical: 13),
    backgroundColor: _EnalyticsColors.lightGreen,
    foregroundColor: _EnalyticsColors.white,
    disabledBackgroundColor: _EnalyticsColors.divider,
    disabledForegroundColor: _EnalyticsColors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
    ),
    textStyle: const TextStyle(fontSize: 16),
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  ),
);

final _outlinedButton = OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    backgroundColor: _EnalyticsColors.white,
    foregroundColor: _EnalyticsColors.lightGreen,
    elevation: 2,
    padding: EdgeInsets.symmetric(vertical: 13),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
    ),
    disabledBackgroundColor: _EnalyticsColors.white,
    disabledForegroundColor: _EnalyticsColors.divider,
    textStyle: const TextStyle(fontSize: 16),
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  ).copyWith(
    side: MaterialStateProperty.resolveWith((states) {
      // If the button is disabled, return border side purple, otherwise grey
      if (states.contains(MaterialState.disabled)) {
        return const BorderSide(color: _EnalyticsColors.divider);
      }
      return const BorderSide(color: _EnalyticsColors.lightGreen);
    }),
  ),
);

final _textButton = TextButtonThemeData(
  style: TextButton.styleFrom(
    backgroundColor: _EnalyticsColors.transparent,
    foregroundColor: _EnalyticsColors.lightGreen,
    elevation: 2,
    padding: EdgeInsets.symmetric(vertical: 13),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
    ),
    disabledBackgroundColor: _EnalyticsColors.transparent,
    disabledForegroundColor: _EnalyticsColors.divider,
    textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
    ),
    tapTargetSize: MaterialTapTargetSize.padded,
  ),
);
