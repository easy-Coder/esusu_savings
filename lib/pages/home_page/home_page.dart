import 'dart:ui';
import 'package:esusu_savings/features/group_save/presentation/group_list/group_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../constant/widgets/space.dart';
import 'overview_page.dart';

final pageIndexProvider = StateProvider<String>((ref) {
  return 'invest';
});

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key, required this.page});

  final Map<String, IconData> nav_icons = {
    "invest": Icons.home,
    "group": Icons.group,
    "chats": Icons.chat,
    "profile": Icons.person
  };

  String page;

  final Map<String, Widget> pages = {
    "invest": OverviewPage(),
    "group": GroupListPage(),
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: pages[page],
      bottomNavigationBar: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: BottomAppBar(
            color: Theme.of(context).colorScheme.surface.withOpacity(0.8),
            elevation: 0.0,
            child: SizedBox(
              height: 65,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 16.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: nav_icons.entries
                      .map<Widget>((item) => GestureDetector(
                            onTap: () => _change_page(context, item.key),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  item.value,
                                  color:
                                      (page == item.key) ? Colors.blue : null,
                                ),
                                const Space(),
                                Text(
                                  item.key,
                                  style: TextStyle(
                                    color:
                                        (page == item.key) ? Colors.blue : null,
                                  ),
                                ),
                              ],
                            ),
                          ))
                      .toList(),
                ),
              ),
            ),
          ),
        ),
      ),
      extendBody: true,
    );
  }

  _change_page(BuildContext context, String key) {
    context.go("/pages/$key");
  }
}
