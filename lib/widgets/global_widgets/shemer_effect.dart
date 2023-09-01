import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  final double width;
  final double height;
  final Duration duration;
  final Color baseColor;
  final Color highlightColor;

  const ShimmerEffect({
    Key? key,
    required this.width,
    required this.height,
    required this.duration,
    required this.baseColor,
    required this.highlightColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      period: duration,
      child: Column(
        children: [
          Container(
            width: width,
            height: height,
            color: Colors.white,
          ),
          const SizedBox(height: 10,),
            Container(
            width: width,
            height: height,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
