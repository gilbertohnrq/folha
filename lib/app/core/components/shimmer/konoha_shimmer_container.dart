import 'package:flutter/material.dart';

class KonohaShimmerContainer extends StatelessWidget {
  final EdgeInsets margin;
  final EdgeInsets padding;
  final double width;
  final double height;
  final double radius;

  const KonohaShimmerContainer({
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    required this.width,
    required this.height,
    this.radius = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        ),
      ),
    );
  }
}
