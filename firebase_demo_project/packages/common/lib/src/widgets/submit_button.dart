import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    super.key,
    required this.onPressed,
    required this.isLoading,
    required this.childWidget,
  });

  final VoidCallback? onPressed;
  final bool isLoading;
  final Widget childWidget;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
      ),
      child: isLoading
          ? Transform.scale(
              scale: .7,
              child: CircularProgressIndicator(
                color: theme.colorScheme.background,
                strokeWidth: 1,
              ),
            )
          : childWidget,
    );
  }
}
