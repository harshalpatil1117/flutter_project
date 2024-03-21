import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/material.dart';

import '../../common.dart';


class ExpandedRowWidget extends StatelessWidget {
  const ExpandedRowWidget({
    super.key,
    required this.nameText,
    required this.valueText,
  });

  final String nameText;
  final String valueText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            padding: padding.symmetric(
              horizontal: Dimensions.small,
              vertical: Dimensions.small,
            ),
            decoration: BoxDecoration(
              color: theme.envoiceColorsExtensions.primary.withOpacity(0.09),
            ),
            child: Text(
              nameText,
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.envoiceColorsExtensions.primary,
              ),
            ),
          ),
        ),
        const Space(Dimensions.smallest),
        Expanded(
          flex: 1,
          child: Container(
            padding: padding.symmetric(
              horizontal: Dimensions.small,
              vertical: Dimensions.small,
            ),
            decoration: BoxDecoration(
              color: theme.envoiceColorsExtensions.primary.withOpacity(0.09),
            ),
            child: Text(
              valueText,
              style: theme.textTheme.bodyLarge?.copyWith(
                color:
                theme.envoiceColorsExtensions.onBackground.withOpacity(0.5),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
