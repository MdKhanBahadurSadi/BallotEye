import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final double? borderRadius;
  final BorderSide? side;

  const AppCard({
    super.key,
    required this.child,
    this.padding,
    this.color,
    this.borderRadius,
    this.side,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shape: borderRadius != null || side != null
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 20),
              side: side ?? BorderSide.none,
            )
          : null,
      child: Padding(
        padding: padding ?? const EdgeInsets.all(16.0),
        child: child,
      ),
    );
  }
}
