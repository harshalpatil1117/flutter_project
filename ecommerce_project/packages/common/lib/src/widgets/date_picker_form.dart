import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateSelectionForm extends StatefulWidget {
  const DateSelectionForm({
    super.key,
    required this.onDateSelected,
    required this.hintText,
    this.needLabel,
    required this.label,
  });

  final Function(String) onDateSelected;
  final String hintText;
  final bool? needLabel;
  final String label;

  @override
  State<DateSelectionForm> createState() => _DateSelectionFormState();
}

class _DateSelectionFormState extends State<DateSelectionForm> {
  DateTime? selectedDate;
  final TextEditingController _dateController = TextEditingController();

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
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
              Text(
                widget.label,
                style: theme.textTheme.titleLarge?.copyWith(
                  color: theme.EcommerceColorsExtensions.onBackground,
                ),
              ),
            ],
          ),
        ) : SizedBox.shrink(),
        TextFormField(
          controller: _dateController,
          onTap: () {
            _selectDate(context);
          },
          keyboardType: TextInputType.none,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.r),
              borderSide: BorderSide(
                color: theme.EcommerceColorsExtensions.border,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(
                color: theme.EcommerceColorsExtensions.primary,
              ),
            ),
            hintText: widget.hintText,
          ),
        ),
      ],
    );
  }

  // Function to show the date picker dialog and update the selectedDate variable.
  Future<void> _selectDate(BuildContext context) async {
    DateFormat inputFormat = DateFormat('dd/MM/yyyy');

    // Parse the contractDate using the defined input format
    DateTime parsedDate = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? parsedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _dateController.text = formatDate(selectedDate!);
      });
      // Call the callback function with the formatted date.
      widget.onDateSelected(_dateController.text);
    }
  }

  // Function to format the selected date in "yyyy/mm/dd" format.
  String formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }
}
