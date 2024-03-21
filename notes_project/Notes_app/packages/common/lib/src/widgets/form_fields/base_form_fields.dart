import 'package:common/common.dart';
import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:shared_preferences/shared_preferences.dart';

typedef FormValidator = String? Function(String?);


class BaseFormField extends StatefulWidget {
  const BaseFormField({
    super.key,
    required this.label,
    required this.isRequired,
    this.controller,
    required this.enabled,
    required this.onValueChanged,
    required this.isPasswordField,
    this.validator,
    this.initialText,
    required this.isNumber,
  });

  final String label;
  final FormValidator? validator;
  final String? initialText;
  final bool isRequired;
  final bool enabled;
  final Function(String) onValueChanged;
  final TextEditingController? controller;
  final bool isPasswordField;
  final bool isNumber;

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
            color: theme.enalyticsColorsExtensions.onBackground.withOpacity(0.5),
            fontWeight: FontWeight.bold,
          ),
        ),
        TextFormField(
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          initialValue: widget.initialText,
          controller: widget.controller,
          enabled: widget.enabled,
          style: theme.textTheme.labelLarge!.copyWith(
            color: theme.enalyticsColorsExtensions.primary,
          ),
          onChanged: widget.onValueChanged,
          obscureText: widget.isPasswordField ? obscureText : false,
          decoration: FormFieldDecoration.decoration(
            context,
            widget.isPasswordField,
            obscureText,
            _setVisibility,
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
  });

  final String label;
  final String hintText;
  final List<String> options;
  final String value;
  final void Function(String?) onChanged;
  final String? Function(String?) validator;

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
        Text(
          widget.label,
          style: theme.textTheme.titleLarge?.copyWith(
            color: theme.enalyticsColorsExtensions.onBackground,
          ),
        ),
        Space(Dimensions.smaller),
        DropdownButtonFormField(
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: theme.enalyticsColorsExtensions.border,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: theme.enalyticsColorsExtensions.primary,
              ),
              borderRadius: BorderRadius.circular(
                Dimensions.of(context).radii.small,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: theme.enalyticsColorsExtensions.error,
              ),
              borderRadius: BorderRadius.circular(
                Dimensions.of(context).radii.small,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: theme.enalyticsColorsExtensions.error,
              ),
              borderRadius: BorderRadius.circular(
                Dimensions.of(context).radii.small,
              ),
            ),
          ),
          iconEnabledColor: theme.enalyticsColorsExtensions.primary,
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
        ),
        Space(Dimensions.smaller),
      ],
    );
  }
}

class DropDownSingle extends StatefulWidget {
  DropDownSingle({
    super.key,
    required this.onChanged,
    required this.startValue,
    required this.validator,
    required this.prefKey,
    required this.isOpen,
  });

  final ValueChanged<String?> onChanged;
  final int startValue;
  final String? Function(String?) validator;
  final String prefKey;
  bool isOpen;

  @override
  State<DropDownSingle> createState() => _DropDownSingleState();
}

class _DropDownSingleState extends State<DropDownSingle> {
  late List<String> dropdownOptions;
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    generateDropdownOptions();
    loadSelectedValue();
  }

  Future<void> loadSelectedValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedValue = widget.isOpen
          ? 'Select Uplift'
          : prefs.getString(widget.prefKey) ?? 'Select Uplift';
    });
  }

  Future<void> saveSelectedValue(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(widget.prefKey, value);
  }

  void generateDropdownOptions() {
    dropdownOptions = List.generate(
        widget.startValue, (index) => (widget.startValue - index).toString());
    dropdownOptions.insert(0, 'Select Uplift');
    selectedValue = dropdownOptions[0];
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DropdownButtonFormField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: theme.enalyticsColorsExtensions.border,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: theme.enalyticsColorsExtensions.primary,
          ),
          borderRadius: BorderRadius.circular(
            Dimensions.of(context).radii.small,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: theme.enalyticsColorsExtensions.error,
          ),
          borderRadius: BorderRadius.circular(
            Dimensions.of(context).radii.small,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: theme.enalyticsColorsExtensions.error,
          ),
          borderRadius: BorderRadius.circular(
            Dimensions.of(context).radii.small,
          ),
        ),
      ),
      iconEnabledColor: theme.enalyticsColorsExtensions.primary,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.validator,
      //value: selectedValue,
      disabledHint: Text(
        selectedValue ?? '',
        style: TextStyle(
          color: Colors.grey.shade400, // Change the disabled text color here
        ),
      ),
      hint: Text(selectedValue ?? ''),
      isExpanded: false,
      borderRadius: BorderRadius.circular(
        Dimensions.of(context).radii.small,
      ),
      onChanged: widget.startValue == 0
          ? null // Disable the dropdown if startValue is 0
          : (String? value) {
              setState(() {
                selectedValue = value;
              });
              widget.onChanged(value);
              saveSelectedValue(value!);
            },
      items: dropdownOptions.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class FormFieldDecoration {
  static InputDecoration decoration(BuildContext context, bool isPassword,
      bool obscureText, VoidCallback? callback) {
    return InputDecoration(
      suffixIcon: isPassword
          ? IconButton(
              onPressed: () => callback!(),
              icon: obscureText
                  ? Icon(Icons.visibility_off)
                  : Icon(Icons.visibility),
            )
          : null,
    );
  }
}
