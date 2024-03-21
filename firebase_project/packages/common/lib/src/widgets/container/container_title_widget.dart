import 'package:common/common.dart';
import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/material.dart';

class ContainerTitleWidget extends StatelessWidget {
  const ContainerTitleWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);
    return Padding(
      padding: padding.symmetric(
        vertical: Dimensions.smaller,
        horizontal: Dimensions.small,
      ),
      child: Container(
        width: double.infinity,
        color: theme.envoiceColorsExtensions.secondary,
        padding: padding.symmetric(
          vertical: Dimensions.smaller,
          horizontal: Dimensions.smaller,
        ),
        child: Text(
          title,
          style: theme.textTheme.titleLarge?.copyWith(
            color: envoiceColorsExtensions.background,
          ),
        ),
      ),
    );
  }
}
