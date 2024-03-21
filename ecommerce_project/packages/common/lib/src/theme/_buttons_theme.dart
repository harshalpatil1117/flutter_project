part of 'theme.dart';

final _elevatedButton = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    elevation: 2,
    padding: EdgeInsets.symmetric(vertical: 13),
    backgroundColor: _EcommerceColors.red,
    foregroundColor: _EcommerceColors.white,
    disabledBackgroundColor: _EcommerceColors.divider,
    disabledForegroundColor: _EcommerceColors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
    ),
    textStyle: const TextStyle(fontSize: 16),
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  ),
);

final _outlinedButton = OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    backgroundColor: _EcommerceColors.white,
    foregroundColor: _EcommerceColors.red,
    elevation: 2,
    padding: EdgeInsets.symmetric(vertical: 13),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
    ),
    disabledBackgroundColor: _EcommerceColors.white,
    disabledForegroundColor: _EcommerceColors.divider,
    textStyle: const TextStyle(fontSize: 16),
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  ).copyWith(
    side: MaterialStateProperty.resolveWith((states) {
      // If the button is disabled, return border side purple, otherwise grey
      if (states.contains(MaterialState.disabled)) {
        return const BorderSide(color: _EcommerceColors.divider);
      }
      return const BorderSide(color: _EcommerceColors.grey);
    }),
  ),
);

final _textButton = TextButtonThemeData(
  style: TextButton.styleFrom(
    backgroundColor: _EcommerceColors.transparent,
    foregroundColor: _EcommerceColors.red,
    elevation: 2,
    padding: EdgeInsets.symmetric(vertical: 13),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
    ),
    disabledBackgroundColor: _EcommerceColors.transparent,
    disabledForegroundColor: _EcommerceColors.divider,
    textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
    ),
    tapTargetSize: MaterialTapTargetSize.padded,
  ),
);
