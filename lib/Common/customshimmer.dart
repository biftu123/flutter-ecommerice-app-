import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  final Color baseColor;
  final Color highlightColor;

  const CustomShimmerWidget({
    Key? key,
    required this.width,
    required this.height,
    this.baseColor = Colors.grey,
    this.highlightColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Container(
        width: width,
        height: height,
        color: Colors.white, // You can change the color here if needed
      ),
    );
  }
}