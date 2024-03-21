part of 'theme.dart';

final _elevatedButton = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    elevation: 2,
    padding: EdgeInsets.symmetric(vertical: 13),
    backgroundColor: _EnvoiceColors.lightGreen,
    foregroundColor: _EnvoiceColors.white,
    disabledBackgroundColor: _EnvoiceColors.divider,
    disabledForegroundColor: _EnvoiceColors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
    ),
    textStyle: const TextStyle(fontSize: 16),
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  ),
);

final _outlinedButton = OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    backgroundColor: _EnvoiceColors.white,
    foregroundColor: _EnvoiceColors.lightGreen,
    elevation: 2,
    padding: EdgeInsets.symmetric(vertical: 13),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
    ),
    disabledBackgroundColor: _EnvoiceColors.white,
    disabledForegroundColor: _EnvoiceColors.divider,
    textStyle: const TextStyle(fontSize: 16),
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  ).copyWith(
    side: MaterialStateProperty.resolveWith((states) {
      // If the button is disabled, return border side purple, otherwise grey
      if (states.contains(MaterialState.disabled)) {
        return const BorderSide(color: _EnvoiceColors.divider);
      }
      return const BorderSide(color: _EnvoiceColors.lightGreen);
    }),
  ),
);

final _textButton = TextButtonThemeData(
  style: TextButton.styleFrom(
    backgroundColor: _EnvoiceColors.transparent,
    foregroundColor: _EnvoiceColors.lightGreen,
    elevation: 2,
    padding: EdgeInsets.symmetric(vertical: 13),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
    ),
    disabledBackgroundColor: _EnvoiceColors.transparent,
    disabledForegroundColor: _EnvoiceColors.divider,
    textStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
    ),
    tapTargetSize: MaterialTapTargetSize.padded,
  ),
);
