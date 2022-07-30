import 'package:client/app/components/default_loading_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';

import '../../size_config.dart';

class DefaultListLoadingCard extends StatelessWidget {
  final int itemCount;

  final int crossAxisCount;

  const DefaultListLoadingCard(
      {Key? key, required this.itemCount, required this.crossAxisCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: MasonryGridView.count(
        primary: false,
        shrinkWrap: true,
        itemCount: itemCount,
        // the number of columns
        crossAxisCount: crossAxisCount,
        // vertical gap between two items
        mainAxisSpacing: getProportionateScreenWidth(10) * 1.2,
        // horizontal gap between two items
        crossAxisSpacing: getProportionateScreenWidth(10) * 1.2,
        itemBuilder: (context, index) {
          return const DefaultLoadingImage();
        },
      ),
    );
  }
}
