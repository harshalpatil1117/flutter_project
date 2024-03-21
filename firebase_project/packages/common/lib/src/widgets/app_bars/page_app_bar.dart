import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PageAppBar extends StatefulWidget implements PreferredSizeWidget {
  const PageAppBar({
    super.key,
    required this.title,
    this.action,
  });

  final String title;
  final List<Widget>? action;

  @override
  State<PageAppBar> createState() => _PageAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}

class _PageAppBarState extends State<PageAppBar> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      backgroundColor:
      theme.envoiceColorsExtensions.secondary.withOpacity(0.85),
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {
          Scaffold.of(context).openDrawer();
          SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle.dark,
          );
        },
        color: theme.envoiceColorsExtensions.background,
      ),
      titleSpacing: 0,
      title: Text(
        widget.title,
        style: theme.textTheme.headlineMedium?.copyWith(
          color: theme.envoiceColorsExtensions.background,
        ),
      ),
      actions: widget.action ?? null,
    );
  }
}
