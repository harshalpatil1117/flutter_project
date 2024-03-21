import 'package:dimensions_theme/dimensions_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeSelectionForm extends StatefulWidget {
  const TimeSelectionForm({
    Key? key,
    required this.onTimeSelected,
    required this.hintText,
    this.needLabel = false,
    required this.label,
    this.rightWidget,
  }) : super(key: key);

  final Function(String) onTimeSelected;
  final String hintText;
  final bool needLabel;
  final String label;
  final Widget? rightWidget;

  @override
  _TimeSelectionFormState createState() => _TimeSelectionFormState();
}

class _TimeSelectionFormState extends State<TimeSelectionForm> {
  TimeOfDay? selectedTime;
  final TextEditingController _timeController = TextEditingController();

  @override
  void dispose() {
    _timeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = EdgeInsetsOf(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.needLabel
            ? Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.label,
                style: theme.textTheme.subtitle1?.copyWith(
                  color: theme.primaryColor,
                ),
              ),
              widget.rightWidget ?? const SizedBox.shrink()
            ],
          ),
        )
            : const SizedBox.shrink(),
        TextFormField(
          controller: _timeController,
          onTap: () {
            _selectTime(context);
          },
          keyboardType: TextInputType.none,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
              borderSide: BorderSide(
                color: theme.primaryColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(),
            ),
            hintText: widget.hintText,

          ),
        ),
      ],
    );
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            timePickerTheme: TimePickerThemeData(
              dialTextStyle: TextStyle(
                color: Colors.green, // Change the color of AM text
              ),
              dayPeriodColor: Colors.red,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
        _timeController.text = formatTime(selectedTime!);
      });

      widget.onTimeSelected(_timeController.text);
    }
  }

  String formatTime(TimeOfDay time) {
    final now = DateTime.now();
    final selectedDateTime =
    DateTime(now.year, now.month, now.day, time.hour, time.minute);
    final formattedTime = DateFormat.jm().format(selectedDateTime);
    return formattedTime;
  }
}



