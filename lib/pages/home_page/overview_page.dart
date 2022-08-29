import 'package:esusu_savings/constant/widgets/app_bar.dart';
import 'package:flutter/material.dart';

import '../../constant/widgets/cards.dart';
import '../../constant/widgets/space.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        CustomSliverAppBar(
          title: Text(
            "Hello, John Doe",
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.add),
            ),
          ],
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              const Space(
                height: 80,
              ),
              Cards(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 30,
                ),
                color: Theme.of(context).colorScheme.primary,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Total Deposited",
                          style: TextStyle(fontSize: 18),
                        ),
                        Space(
                          height: 10,
                        ),
                        Text(
                          "₦3,000.00",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      height: 30,
                      thickness: 4,
                      color: Color(0xffBDBDBD),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Total Withdrawed",
                          style: TextStyle(fontSize: 18),
                        ),
                        Space(
                          height: 10,
                        ),
                        Text(
                          "₦3,000.00",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Space(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Cards(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 12),
                      color: Theme.of(context).colorScheme.primary,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Total Missed",
                            style: TextStyle(fontSize: 18),
                          ),
                          Space(
                            height: 10,
                          ),
                          Text(
                            "8",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Space(
                    width: 8,
                  ),
                  Expanded(
                    child: Cards(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 12),
                      color: Theme.of(context).colorScheme.primary,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Personal Savings",
                            style: TextStyle(fontSize: 18),
                          ),
                          Space(
                            height: 10,
                          ),
                          Text(
                            "₦9,000.00",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: const Space(
            height: 4,
          ),
        ),
        SliverToBoxAdapter(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Text(
              "Personal Goals",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
            TextButton(child: const Text("See All"), onPressed: () {}),
          ]),
        ),
        SliverToBoxAdapter(
          child: const Space(
            height: 4,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => Cards(
              margin: const EdgeInsets.only(bottom: 8.0),
              padding: const EdgeInsets.only(right: 8.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: const ColoredBox(
                      color: Colors.blue,
                      child: SizedBox(
                        height: 100,
                        width: 100,
                      ),
                    ),
                  ),
                  const Space(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Travel Plan",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                        const Space(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "89%",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(
                              child: Row(
                                children: const [
                                  Text("You Saved:"),
                                  Text(
                                    "₦400",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            childCount: 10,
          ),
        ),
        SliverToBoxAdapter(
          child: const Space(
            height: 50,
          ),
        )
      ],
    );
  }
}
