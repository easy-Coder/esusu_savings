import 'dart:ui';
import 'package:flutter/material.dart';

class CustomBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final List<Widget>? actions;
  const CustomBar({Key? key, required this.title, this.actions})
      : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: AppBar(
            elevation: 0.0,
            scrolledUnderElevation: 0.0,
            actions: (actions != null) ? [...?actions] : null,
            title: title,
            backgroundColor:
                Theme.of(context).colorScheme.surface.withOpacity(0.3),
          )),
    );
  }
}
