import 'dart:ui';

import 'package:esusu_savings/constant/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../constant/widgets/cards.dart';
import '../../constant/widgets/space.dart';
import 'overview_page.dart';

final pageIndexProvider = StateProvider<int>((ref) {
  return 0;
});

class HomeScreen extends ConsumerWidget {
  HomeScreen({Key? key}) : super(key: key);

  // list of pages title
  final List<String> pageTitle = [
    "Hello, John Doe",
    "Groups",
    "Chats",
    "Profile"
  ];

  final List<Widget> pages = const [
    OverviewPage(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageIndex = ref.watch(pageIndexProvider);
    return Scaffold(
      appBar: CustomBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
        title: Text(
          pageTitle[pageIndex],
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: IndexedStack(
        index: pageIndex,
        children: pages,
      ),
      bottomNavigationBar: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: BottomAppBar(
            color: Theme.of(context).colorScheme.surface.withOpacity(0.8),
            elevation: 0.0,
            child: SizedBox(
              height: 70,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 16.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    GestureDetector(
                      onTap: () => ref.read(pageIndexProvider.state).state = 0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.home_filled,
                            color: (pageIndex == 0) ? Colors.blue : null,
                          ),
                          const Space(),
                          Text("Home",
                              style: TextStyle(
                                color: (pageIndex == 0) ? Colors.blue : null,
                              )),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => ref.read(pageIndexProvider.state).state = 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.group,
                            color: (pageIndex == 1) ? Colors.blue : null,
                          ),
                          const Space(),
                          Text(
                            "Groups",
                            style: TextStyle(
                              color: (pageIndex == 1) ? Colors.blue : null,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => ref.read(pageIndexProvider.state).state = 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.chat,
                            color: (pageIndex == 2) ? Colors.blue : null,
                          ),
                          const Space(),
                          Text(
                            "Chats",
                            style: TextStyle(
                              color: (pageIndex == 2) ? Colors.blue : null,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () => ref.read(pageIndexProvider.state).state = 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person,
                            color: (pageIndex == 3) ? Colors.blue : null,
                          ),
                          const Space(),
                          Text(
                            "Profile",
                            style: TextStyle(
                              color: (pageIndex == 3) ? Colors.blue : null,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      extendBody: true,
    );
  }
}
