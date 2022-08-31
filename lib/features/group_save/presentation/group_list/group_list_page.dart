import 'package:esusu_savings/constant/error/error.dart';
import 'package:esusu_savings/constant/widgets/app_bar.dart';
import 'package:esusu_savings/constant/widgets/cards.dart';
import 'package:esusu_savings/features/group_save/controller/group_save.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class GroupListPage extends ConsumerStatefulWidget {
  const GroupListPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GroupListPageState();
}

class _GroupListPageState extends ConsumerState<GroupListPage>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    // ref.refresh(groupStreamProvider);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final groupState = ref.watch(groupStreamProvider);
    return CustomScrollView(
      slivers: [
        CustomSliverAppBar(
          title: Text(
            "Groups",
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                context.push("/create-group");
              },
              icon: Icon(Icons.add),
            ),
          ],
        ),
        groupState.when(
          data: (data) {
            if (data.isEmpty) {
              return SliverFillRemaining(
                  hasScrollBody: false,
                  child: SizedBox(
                    child: Center(
                      child: Text(
                        "You don't have any group.",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ));
            }
            print(data);
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Cards(child: Text(data[index]!.name)),
                childCount: data.length,
              ),
            );
          },
          error: (error, _) => SliverFillRemaining(
            hasScrollBody: false,
            child: SizedBox.expand(
              child: Center(child: Text((error as CustomException).message)),
            ),
          ),
          loading: () => SliverFillRemaining(
            hasScrollBody: false,
            child: SizedBox.expand(
              child: Center(child: CircularProgressIndicator()),
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
