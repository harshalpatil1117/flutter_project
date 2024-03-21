import 'package:common/common.dart';
import 'package:flutter/material.dart';

class SingleCheckBoxTile extends StatefulWidget {
  const SingleCheckBoxTile({
    super.key,
    required this.titleText,
    required this.onChecked,
    this.isContractScreen,
  });

  final String titleText;
  final Function(bool isSame) onChecked;
  final bool? isContractScreen;

  @override
  State<SingleCheckBoxTile> createState() => _SingleCheckBoxTileState();
}

class _SingleCheckBoxTileState extends State<SingleCheckBoxTile> {
  bool _isSame = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Checkbox(
          value: _isSame,
          onChanged: (newValue) {
            setState(() {
              _isSame = newValue!;
            });
            widget.onChecked(_isSame);
          },
        ),
        widget.isContractScreen ?? false
            ? Expanded(
                child: Text(
                  widget.titleText,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.enalyticsColorsExtensions.primary,
                  ),
                ),
              )
            : Text(
                widget.titleText,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.enalyticsColorsExtensions.primary,
                ),
              ),
      ],
    );
  }
}
