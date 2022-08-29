import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    this.onTap,
    required this.child,
    this.height,
    this.width,
  }) : super(key: key);

  final Widget child;
  final VoidCallback? onTap;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: SizedBox(
          height: height,
          width: width,
          child: ColoredBox(
            color: (onTap == null)
                ? Colors.grey.shade600
                : const Color(0xFF536dfe),
            child: Center(
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
