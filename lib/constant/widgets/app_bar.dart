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

class CustomSliverAppBar extends StatelessWidget {
  final Widget title;
  final List<Widget>? actions;

  const CustomSliverAppBar({super.key, required this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: _CustomSliverAppBarDelegate(
          title, actions, MediaQuery.of(context).padding),
      pinned: true,
      floating: false,
    );
  }
}

class _CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget title;
  final List<Widget>? actions;
  final EdgeInsets safePadding;

  _CustomSliverAppBarDelegate(this.title, this.actions, this.safePadding);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return CustomBar(
      title: title,
      actions: actions,
    );
  }

  @override
  double get maxExtent => minExtent;

  @override
  double get minExtent => safePadding.top + kToolbarHeight;

  @override
  bool shouldRebuild(_CustomSliverAppBarDelegate oldDelegate) {
    return (oldDelegate.title != title) ||
        (oldDelegate.actions != actions) ||
        (oldDelegate.maxExtent != maxExtent) ||
        (oldDelegate.minExtent != minExtent) ||
        (oldDelegate.safePadding != safePadding);
  }
}
