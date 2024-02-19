import 'package:flutter/material.dart';
import 'package:tr_store_app/common/widgets/app_shimmer_widget.dart';
import 'package:tr_store_app/utils/app_constraints.dart';

class ShimmerProductList extends StatelessWidget {
  const ShimmerProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 5),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          mainAxisExtent: 200
      ),
      itemCount: 20,
      shrinkWrap: true,
      itemBuilder: (context, i) {
        return const Card(
          margin: EdgeInsets.zero,
          elevation: 1,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                AppShimmerWidget(
                  height: 80,
                ),
                AppConstraints.height5,
                AppShimmerWidget(
                  height: 25,
                ),
                AppConstraints.height5,
                AppShimmerWidget(
                  height: 20,
                ),
                AppConstraints.height10,
                AppShimmerWidget(
                  height: 32,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
