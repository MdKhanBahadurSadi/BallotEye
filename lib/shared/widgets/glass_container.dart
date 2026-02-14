import 'dart:ui';
import 'package:flutter/material.dart';

/// A reusable glassmorphic container with performance-safe mode.
class GlassContainer extends StatelessWidget {
  final Widget? child;
  final double blur;
  final double opacity;
  final double borderRadius;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final Gradient? gradient;
  final BoxBorder? border;

  /// If true, the blur effect will be applied. 
  /// Set to [false] for low-end devices to improve performance.
  final bool useBlur;

  const GlassContainer({
    super.key,
    this.child,
    this.blur = 16.0,
    this.opacity = 0.15,
    this.borderRadius = 16.0,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.color,
    this.gradient,
    this.border,
    this.useBlur = true,
  });

  @override
  Widget build(BuildContext context) {
    if (!useBlur) {
      return Container(
        width: width,
        height: height,
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          color: (color ?? Colors.white).withOpacity(opacity + 0.1),
          borderRadius: BorderRadius.circular(borderRadius),
          border: border ?? Border.all(
            color: Colors.white.withOpacity(0.2),
            width: 0.5,
          ),
          gradient: gradient,
        ),
        child: child,
      );
    }

    return Container(
      width: width,
      height: height,
      margin: margin,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: (color ?? Colors.white).withOpacity(opacity),
            borderRadius: BorderRadius.circular(borderRadius),
            border: border ?? Border.all(
              color: Colors.white.withOpacity(0.2),
              width: 0.5,
            ),
            gradient: gradient,
          ),
          child: child,
        ),
      ),
    );
  }
}
