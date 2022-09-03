import 'package:esusu_savings/constant/enum.dart';
import 'package:esusu_savings/constant/error/error.dart';
import 'package:esusu_savings/constant/widgets/cards.dart';
import 'package:esusu_savings/constant/widgets/space.dart';
import 'package:esusu_savings/features/group_save/controller/group_save.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class GroupListPage extends ConsumerStatefulWidget {
  const GroupListPage({super.key});

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
    super.build(context);
    final groupState = ref.watch(groupStreamProvider);
    return CustomScrollView(
      slivers: [
        SliverAppBar.large(
          title: Text(
            "Groups",
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
            return SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final group = data[index]!;
                    return Cards(
                      padding: EdgeInsets.all(16.0),
                      margin: EdgeInsets.only(
                        bottom: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  group.name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              group.type == GroupsType.goals
                                  ? Space(
                                      width: 24,
                                      height: 24,
                                      child: Image.asset(
                                        "assets/Goal_Icon.png",
                                        color: (Theme.of(context).brightness ==
                                                Brightness.light)
                                            ? Colors.black
                                            : null,
                                      ),
                                    )
                                  : Space(
                                      width: 24,
                                      height: 24,
                                      child: Image.asset(
                                        "assets/Loop_Left_Rotation_Icon.png",
                                        color: (Theme.of(context).brightness ==
                                                Brightness.light)
                                            ? Colors.black
                                            : null,
                                      ),
                                    ),
                            ],
                          ),
                          Space(
                            height: 30,
                          ),
                          UsersStack(
                            members: group.members,
                          ),
                        ],
                      ),
                    );
                  },
                  childCount: data.length,
                ),
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

class UsersStack extends StatelessWidget {
  const UsersStack({
    Key? key,
    required this.members,
  }) : super(key: key);

  final Map members;
  final double position = 12.0;

  @override
  Widget build(BuildContext context) {
  int counter = 1;
    return Space(
      width: 240,
      height: 30,
      child: Stack(
        children: [
          ...List.generate(
            members.length + 12,
            (index) {
              counter++;
              return (index > 9)
                  ? Space()
                  : Positioned(
                      left: position * index,
                      child: Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Theme.of(context).colorScheme.surface, width: 2.0),
                            color: Theme.of(context).colorScheme.surface,
                            borderRadius: BorderRadius.circular(9999)),
                        child: CircleAvatar(
                          backgroundColor: Colors.blue,
                        ),
                      ),
                    );
            },
          ),
          if (counter - 10 > 1)
            Positioned(
              left: position * 10,
              child: Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).colorScheme.surface, width: 2.0),
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(9999)),
                child: Center(child: Text("+${counter - 10}")),
              ),
            ),
        ],
      ),
    );
  }
}
