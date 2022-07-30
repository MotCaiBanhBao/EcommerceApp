import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'default_loading_image.dart';

class DefaultInternetImage extends StatelessWidget {
  const DefaultInternetImage(
      {Key? key, required this.imageUri, required this.tagId})
      : super(key: key);
  final String imageUri;
  final String tagId;
  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: tagId,
        child: CachedNetworkImage(
          imageUrl: imageUri,
          placeholder: (context, url) => const DefaultLoadingImage(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ));
  }
}
