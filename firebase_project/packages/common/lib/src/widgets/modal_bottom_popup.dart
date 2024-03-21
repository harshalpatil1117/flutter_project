import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future showModalBottomPopup({
  required Widget child,
  required BuildContext context,
  bool? isDismissible,
}) {
  return showModalBottomSheet(
      enableDrag: isDismissible ?? true,
      isDismissible: isDismissible ?? true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.r),
        ),
      ),
      context: context,
      builder: (context) => child);
}
