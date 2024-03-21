import 'package:common/common.dart';
import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/material.dart';

class SecondaryOutlinedButton extends StatelessWidget {
  const SecondaryOutlinedButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return OutlinedButton(
      onPressed: onPressed,
      style: theme.outlinedButtonTheme.style?.copyWith(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              Dimensions.of(context).radii.largest,
            ),
          ),
        ),
        side: MaterialStateProperty.all(
          BorderSide(
            color: theme.EcommerceColorsExtensions.border,
          ),
        ),
      ),
      child: Text(
        text,
        style: theme.textTheme.labelLarge,
      ),
    );
  }
}

class SecondaryOutlinedIconButton extends StatelessWidget {
  const SecondaryOutlinedIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  final VoidCallback? onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return OutlinedButton(
      onPressed: onPressed,
      style: theme.outlinedButtonTheme.style?.copyWith(
        shape: MaterialStateProperty.all(
          const CircleBorder(),
        ),
        side: MaterialStateProperty.all(
          BorderSide(
            color: theme.EcommerceColorsExtensions.border,
          ),
        ),
      ),
      child: Icon(
        icon,
        color: theme.EcommerceColorsExtensions.onBackground,
      ),
    );
  }
}

class SecondaryOutlinedIconTextButton extends StatelessWidget {
  const SecondaryOutlinedIconTextButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.text,
  });

  final VoidCallback? onPressed;
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return OutlinedButton(
      onPressed: onPressed,
      style: theme.outlinedButtonTheme.style?.copyWith(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              Dimensions.of(context).radii.largest,
            ),
          ),
        ),
        side: MaterialStateProperty.all(
          BorderSide(
            color: theme.EcommerceColorsExtensions.border,
          ),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: theme.EcommerceColorsExtensions.onBackground,
          ),
          const SpaceSmallest(),
          Text(
            text,
            style: theme.textTheme.labelLarge,
          ),
        ],
      ),
    );
  }
}
