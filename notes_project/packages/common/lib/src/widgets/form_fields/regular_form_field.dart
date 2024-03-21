import 'package:common/common.dart';
import 'package:flutter/material.dart';

class RegularTextFormField extends StatefulWidget {
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
  final int? maxLine;
  final int? maxLength;

  const RegularTextFormField({
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
    this.maxLine,
    this.maxLength,
  });

  @override
  State<RegularTextFormField> createState() => _RegularTextFormFieldState();
}

class _RegularTextFormFieldState extends State<RegularTextFormField> {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.needLabel ?? false ?  Padding(
          padding: EdgeInsets.only(bottom: 8.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  widget.label,
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: theme.enalyticsColorsExtensions.onBackground,
                  ),
                ),
              ),
            ],
          ),
        ) : SizedBox.shrink(),
        TextFormField(
          maxLines: widget.maxLine,
          maxLength: widget.maxLength,
          focusNode: _focusNode,
          keyboardType: widget.isNumber ?? false
              ? TextInputType.number
              : TextInputType.name,
          textInputAction: TextInputAction.next,
          onChanged: widget.onChange,
          onEditingComplete: widget.onEditingComplete,
          // onFieldSubmitted: (value) {
          //   widget.onChange?.call(value);
          //   _focusNode.unfocus(); // Manually unfocus the field
          // },
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: widget.controller,
          validator: widget.validation,
          enabled: widget.enabled,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: theme.textTheme.headlineSmall?.copyWith(
              color:
                  theme.enalyticsColorsExtensions.onBackground.withOpacity(0.4),
              fontWeight: FontWeight.w700,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.r),
              borderSide: BorderSide(
                color: theme.enalyticsColorsExtensions.border,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(
                color: theme.enalyticsColorsExtensions.error,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(
                color: theme.enalyticsColorsExtensions.primary,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(
                color: theme.enalyticsColorsExtensions.error,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(
                color: theme.enalyticsColorsExtensions.border,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(
                color: theme.enalyticsColorsExtensions.border,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SingleTextFormField extends StatelessWidget {
  const SingleTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.onChange,
    required this.validation,
    this.fieldKey,
    this.enabled,
  });

  final bool? enabled;
  final String hintText;
  final TextEditingController controller;
  final Function(String?) validation;
  final Function(String?)? onChange;
  final GlobalKey<FormFieldState>? fieldKey;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      textInputAction: TextInputAction.next,
      onChanged: onChange,
      controller: controller,
      enabled: enabled,
      validator: (value) => validation(value),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: theme.textTheme.headlineSmall?.copyWith(
          color: theme.enalyticsColorsExtensions.onBackground.withOpacity(0.4),
          fontWeight: FontWeight.w700,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: BorderSide(
            color: theme.enalyticsColorsExtensions.border,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: theme.enalyticsColorsExtensions.error,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: theme.enalyticsColorsExtensions.primary,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: theme.enalyticsColorsExtensions.error,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: theme.enalyticsColorsExtensions.border,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: theme.enalyticsColorsExtensions.border,
          ),
        ),
      ),
    );
  }
}
