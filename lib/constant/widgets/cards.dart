import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  const Cards({
    Key? key,
    this.padding,
    this.color,
    required this.child,
    this.width,
    this.height, this.margin,
  }) : super(key: key);

  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final Widget child;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
        margin: margin,
        color: color ?? Theme.of(context).colorScheme.surface,
        child: SizedBox(
          width: width,
          height: height,
          child: Padding(
            padding: padding ?? const EdgeInsets.all(0.0),
            child: child,
          ),
        ),
      ),
    );
  }
}
