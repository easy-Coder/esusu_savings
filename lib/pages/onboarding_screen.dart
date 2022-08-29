import 'package:concentric_transition/page_view.dart';
import 'package:esusu_savings/provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

final pages = [
  const PageData(
    image: 'assets/Welcome.svg',
    title: "Saving with style just get easier.",
    bgColor: Color.fromARGB(255, 0, 44, 138),
    textColor: Colors.white,
  ),
  const PageData(
    image: 'assets/successful task completion.svg',
    title: "Save toward your goals.",
    textColor: Colors.white,
    bgColor: Color.fromARGB(255, 212, 8, 8),
  ),
  const PageData(
    image: 'assets/Community group.svg',
    title: "Save in group either toward a goal or esusu savings",
    bgColor: Color(0xFFFFFFFF),
  ),
];

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ConcentricPageView(
        colors: pages.map((p) => p.bgColor).toList(),
        radius: screenWidth * 0.1,
        // curve: Curves.ease,
        onFinish: () => ref.read(appProvider).onboarded = true,
        nextButtonBuilder: (context) => Padding(
          padding: const EdgeInsets.only(left: 3), // visual center
          child: Icon(
            Icons.navigate_next,
            size: screenWidth * 0.08,
          ),
        ),
        // itemCount: pages.length,
        // duration: const Duration(milliseconds: 1500),
        // opacityFactor: 2.0,
        // scaleFactor: 0.2,
        // verticalPosition: 0.7,
        // direction: Axis.vertical,
        itemCount: pages.length,
        // physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (index) {
          final page = pages[index % pages.length];
          return SafeArea(
            child: _Page(page: page),
          );
        },
      ),
    );
  }
}

class PageData {
  final String? title;
  final String? image;
  final Color bgColor;
  final Color textColor;

  const PageData({
    this.title,
    this.image,
    this.bgColor = Colors.white,
    this.textColor = Colors.black,
  });
}

class _Page extends StatelessWidget {
  final PageData page;

  const _Page({Key? key, required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    space(double p) => SizedBox(height: screenHeight * p / 100);
    return Column(
      children: [
        space(10),
        _Image(
          page: page,
          width: 320,
          height: 240,
        ),
        space(8),
        _Text(
          page: page,
          style: TextStyle(
            fontSize: screenHeight * 0.046,
          ),
        ),
      ],
    );
  }
}

class _Text extends StatelessWidget {
  const _Text({
    Key? key,
    required this.page,
    this.style,
  }) : super(key: key);

  final PageData page;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      page.title ?? '',
      style: TextStyle(
        color: page.textColor,
        fontWeight: FontWeight.w600,
        fontFamily: 'Helvetica',
        letterSpacing: 0.0,
        fontSize: 18,
        height: 1.2,
      ).merge(style),
      textAlign: TextAlign.center,
    );
  }
}

class _Image extends StatelessWidget {
  const _Image({
    Key? key,
    required this.page,
    required this.width,
    required this.height,
  }) : super(key: key);

  final PageData page;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(60.0)),
      ),
      child: SvgPicture.asset(page.image!),
    );
  }
}
