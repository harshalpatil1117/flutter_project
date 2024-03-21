import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class DateSelectionForm extends StatefulWidget {
  const DateSelectionForm({
    super.key,
    required this.onDateSelected,
    required this.hintText,
  });

  final Function(String) onDateSelected;
  final String hintText;

  @override
  State<DateSelectionForm> createState() => _DateSelectionFormState();
}

class _DateSelectionFormState extends State<DateSelectionForm> {
  DateTime? selectedDate;
  final TextEditingController _dateController = TextEditingController();

  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _dateController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      controller: _dateController,
      onTap: () {
        _selectDate(context);
      },
      focusNode: _focusNode,
      keyboardType: TextInputType.none,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.r),
          borderSide: BorderSide(
            color: theme.envoiceColorsExtensions.border,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: theme.envoiceColorsExtensions.primary,
          ),
        ),
        hintText: widget.hintText,
      ),
    );
  }

  // Function to show the date picker dialog and update the selectedDate variable.
  Future<void> _selectDate(BuildContext context) async {
    // Parse the contractDate using the defined input format
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _dateController.text = formatDate(selectedDate!);
      });
      // Call the callback function with the formatted date.
      widget.onDateSelected(_dateController.text);
      Future.delayed(Duration(milliseconds: 100), () {
        _focusNode.unfocus();
      });
    }
    }

  // Function to format the selected date in "yyyy/mm/dd" format.
  String formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }
}
