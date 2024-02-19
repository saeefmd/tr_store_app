import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppShimmerWidget extends StatelessWidget {
  const AppShimmerWidget({
    super.key,
    this.width,
    this.height,
    this.borderRadius});

  final double? width;
  final double? height;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: height ?? 20,
        width: width ?? MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.grey.shade400,
            borderRadius: BorderRadius.circular(borderRadius ?? 8)
        ),
      ),
    );
  }
}