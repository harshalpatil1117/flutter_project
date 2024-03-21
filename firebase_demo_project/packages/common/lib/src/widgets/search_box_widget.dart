import 'package:common/common.dart';
import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBoxWidget extends StatefulWidget {
  final bool? enabled;
  final String label;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?) validation;
  final Function(String?)? onChange;
  final Function()? onEditingComplete;
  final GlobalKey<FormFieldState>? fieldKey;
  final bool? needLabel;
  final bool? isNumber;
  final bool? isDense;
  final VoidCallback? onPressed;

  const SearchBoxWidget({
    super.key,
    required this.controller,
    required this.label,
    required this.hintText,
    this.onChange,
    this.onEditingComplete,
    required this.validation,
    this.fieldKey,
    this.enabled,
    this.needLabel,
    this.isNumber,
    this.isDense,
    this.onPressed,
  });

  @override
  State<SearchBoxWidget> createState() => _SearchBoxWidgetState();
}

class _SearchBoxWidgetState extends State<SearchBoxWidget> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _handleFocusChange() {
    if (!_focusNode.hasFocus) {
      widget.onEditingComplete?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.needLabel ?? false
            ? Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.label,
                      style: theme.textTheme.titleLarge?.copyWith(
                        color: theme.envoiceColorsExtensions.onBackground,
                      ),
                    ),
                  ],
                ),
              )
            : SizedBox.shrink(),
        TextFormField(
          focusNode: _focusNode,
          keyboardType: widget.isNumber ?? false
              ? TextInputType.number
              : TextInputType.name,
          textInputAction: TextInputAction.next,
          onChanged: widget.onChange,
          onEditingComplete: widget.onEditingComplete,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: widget.controller,
          validator: widget.validation,
          enabled: widget.enabled,
          decoration: InputDecoration(
            isDense: widget.isDense,
            suffixIcon: IconButton(
              icon: Icon(Icons.search),
              onPressed: widget.onPressed,
            ),
            hintText: widget.hintText,
            hintStyle: theme.textTheme.headlineSmall?.copyWith(
              color:
                  theme.envoiceColorsExtensions.onBackground.withOpacity(0.4),
              fontWeight: FontWeight.w700,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.r),
              borderSide: BorderSide(
                color: theme.envoiceColorsExtensions.border,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(
                color: theme.envoiceColorsExtensions.error,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(
                color: theme.envoiceColorsExtensions.primary,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(
                color: theme.envoiceColorsExtensions.error,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(
                color: theme.envoiceColorsExtensions.border,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(
                color: theme.envoiceColorsExtensions.border,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
