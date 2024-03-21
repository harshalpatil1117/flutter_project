import 'package:common/common.dart';
import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BaseFormField extends StatefulWidget {
  const BaseFormField({
    super.key,
    required this.label,
    this.controller,
    required this.enabled,
    required this.validation,
    required this.isPasswordField,
    required this.isNumber,
    required this.hintText,
  });

  final String label;
  final bool enabled;
  final TextEditingController? controller;
  final String? Function(String?) validation;
  final bool isPasswordField;
  final bool isNumber;
  final String hintText;

  @override
  State<BaseFormField> createState() => _BaseFormFieldState();
}

class _BaseFormFieldState extends State<BaseFormField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: theme.textTheme.bodyLarge!.copyWith(
            color: theme.envoiceColorsExtensions.onBackground.withOpacity(0.5),
            fontWeight: FontWeight.bold,
          ),
        ),
        TextFormField(
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          controller: widget.controller,
          enabled: widget.enabled,
          style: theme.textTheme.labelLarge!.copyWith(
            color: theme.envoiceColorsExtensions.onBackground,
          ),
          validator: widget.validation,
          obscureText: widget.isPasswordField ? obscureText : false,
          decoration: FormFieldDecoration.decoration(
            context,
            widget.isPasswordField,
            obscureText,
            _setVisibility,
            widget.hintText,
          ),
        ),
      ],
    );
  }

  _setVisibility() {
    setState(() {
      obscureText = !obscureText;
    });
  }
}

class SelectAddressFormField extends StatefulWidget {
  SelectAddressFormField(
      {super.key,
      required this.label,
      required this.onChanged,
      required this.options,
      required this.value});

  final String label;
  String value;
  final Function(String) onChanged;
  final List<String> options;

  @override
  State<SelectAddressFormField> createState() => _SelectFormFieldState();
}

class _SelectFormFieldState extends State<SelectAddressFormField> {
  @override
  Widget build(BuildContext context) {
    return BaseDropDownFormField(
      label: widget.label,
      options: widget.options,
      value: widget.value,
      onChanged: (newValue) {
        _dropDownOnChanged(newValue);
      },
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please select an option';
        }
        return null; // Return null if there's no error
      },
    );
  }

  void _dropDownOnChanged(String? newValue) {
    setState(
      () {
        widget.value = newValue!;
        widget.onChanged(widget.value);
      },
    );
  }
}

class BaseDropDownFormField extends StatefulWidget {
  const BaseDropDownFormField({
    super.key,
    required this.label,
    this.hintText = 'select',
    this.options = const [],
    required this.value,
    required this.onChanged,
    required this.validator,
    this.enabled,
    this.needAsteriskSign,
  });

  final String label;
  final String hintText;
  final List<String> options;
  final String value;
  final void Function(String?) onChanged;
  final String? Function(String?) validator;
  final bool? enabled;
  final bool? needAsteriskSign;

  @override
  State<BaseDropDownFormField> createState() => _BaseDropDownFormFieldState();
}

class _BaseDropDownFormFieldState extends State<BaseDropDownFormField> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: widget.label,
                style: TextStyle(
                  color: Colors.black, // Label color in black
                  fontSize: theme.textTheme.titleLarge?.fontSize,
                  fontWeight: theme.textTheme.titleLarge?.fontWeight,
                ),
              ),
              widget.needAsteriskSign ?? false ? TextSpan(
                text: ' *',
                style: TextStyle(
                  color: Colors.red, // Asterisk color in red
                ),
              ) : TextSpan(),
            ],
          ),
        ),
        Space(Dimensions.smaller),
        DropdownButtonFormField(

          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: theme.envoiceColorsExtensions.border,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: theme.envoiceColorsExtensions.primary,
              ),
              borderRadius: BorderRadius.circular(
                Dimensions.of(context).radii.small,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: theme.envoiceColorsExtensions.error,
              ),
              borderRadius: BorderRadius.circular(
                Dimensions.of(context).radii.small,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: theme.envoiceColorsExtensions.error,
              ),
              borderRadius: BorderRadius.circular(
                Dimensions.of(context).radii.small,
              ),
            ),
          ),

          iconEnabledColor: theme.envoiceColorsExtensions.primary,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: widget.validator,
          // value: value,
          hint: Text(widget.value),
          isExpanded: true,
          borderRadius: BorderRadius.circular(
            Dimensions.of(context).radii.small,
          ),
          onChanged: widget.enabled ?? true ?
              (String? newValue) {
            widget.onChanged(newValue);
          } : null,
          alignment: AlignmentDirectional.topStart,
          items: widget.options
              .asMap()
              .entries
              .map<DropdownMenuItem<String>>((entry) {
            final index = entry.key;
            final item = entry.value;
            return DropdownMenuItem<String>(
              value: '$item*$index', // Adding index to make values unique
              child: Text(item),
            );
          }).toList(),
        ),
        Space(Dimensions.smaller),
      ],
    );
  }
}

class DropDownSingle extends StatefulWidget {
  DropDownSingle({
    super.key,

    this.hintText = 'select',
    this.options = const [],
    required this.value,
    required this.onChanged,
    required this.validator,
  });

  final String hintText;
  final List<String> options;
  final String value;
  final void Function(String?) onChanged;
  final String? Function(String?) validator;

  @override
  State<DropDownSingle> createState() => _DropDownSingleState();
}

class _DropDownSingleState extends State<DropDownSingle> {

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DropdownButtonFormField(
      padding: EdgeInsets.zero,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: theme.envoiceColorsExtensions.border,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: theme.envoiceColorsExtensions.primary,
          ),
          borderRadius: BorderRadius.circular(
            Dimensions.of(context).radii.small,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: theme.envoiceColorsExtensions.error,
          ),
          borderRadius: BorderRadius.circular(
            Dimensions.of(context).radii.small,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: theme.envoiceColorsExtensions.error,
          ),
          borderRadius: BorderRadius.circular(
            Dimensions.of(context).radii.small,
          ),
        ),
      ),
      isDense: true,
      iconEnabledColor: theme.envoiceColorsExtensions.primary,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.validator,
      // value: value,
      hint: Text(widget.value),
      isExpanded: true,
      borderRadius: BorderRadius.circular(
        Dimensions.of(context).radii.small,
      ),
      onChanged: (String? newValue) {
        widget.onChanged(newValue);
      },
      alignment: AlignmentDirectional.topStart,
      items: widget.options
          .asMap()
          .entries
          .map<DropdownMenuItem<String>>((entry) {
        final index = entry.key;
        final item = entry.value;
        return DropdownMenuItem<String>(
          value: '$item*$index', // Adding index to make values unique
          child: Text(item),
        );
      }).toList(),
    );
  }
}

class FormFieldDecoration {
  static InputDecoration decoration(BuildContext context, bool isPassword,
      bool obscureText, VoidCallback? callback, String hintTextValue) {
    return InputDecoration(
      hintText: hintTextValue,
      suffixIcon: isPassword
          ? IconButton(
              onPressed: () => callback!(),
              icon: obscureText
                  ? Icon(Icons.visibility_off)
                  : Icon(Icons.visibility),
            )
          : null,
      hintStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
        color:
        Theme.of(context).envoiceColorsExtensions.onBackground.withOpacity(0.4),
        fontWeight: FontWeight.w700,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.r),
        borderSide: BorderSide(
          color: Theme.of(context).envoiceColorsExtensions.border,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(
          color: Theme.of(context).envoiceColorsExtensions.error,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(
          color: Theme.of(context).envoiceColorsExtensions.primary,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(
          color: Theme.of(context).envoiceColorsExtensions.error,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(
          color: Theme.of(context).envoiceColorsExtensions.border,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(
          color: Theme.of(context).envoiceColorsExtensions.border,
        ),
      ),
    );
  }
}
