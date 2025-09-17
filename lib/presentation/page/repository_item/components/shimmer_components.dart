import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCircle extends StatelessWidget {
  const ShimmerCircle({super.key, required this.radius});
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: CircleAvatar(radius: radius, backgroundColor: Colors.white),
    );
  }
}

class ShimmerContainer extends StatelessWidget {
  const ShimmerContainer({
    super.key,
    required this.height,
    required this.width,
    required this.borderRadius,
  });

  final double height;
  final double width;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: borderRadius,
        ),
      ),
    );
  }
}
