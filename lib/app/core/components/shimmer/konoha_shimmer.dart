import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class KonohaShimmer extends StatelessWidget {
  final Widget child;
  final Color color;
  final double highlightOpacity;
  final EdgeInsetsGeometry? padding;

  const KonohaShimmer({
    required this.child,
    this.color = const Color(0xFFefefef),
    this.highlightOpacity = 0.3,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      width: double.infinity,
      child: Shimmer.fromColors(
        period: const Duration(milliseconds: 1000),
        baseColor: color,
        highlightColor: color.withOpacity(highlightOpacity),
        child: child,
      ),
    );
  }
}
