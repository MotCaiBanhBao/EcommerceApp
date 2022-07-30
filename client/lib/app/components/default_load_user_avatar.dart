import 'package:cached_network_image/cached_network_image.dart';
import 'package:client/app/helper/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'default_loading_image.dart';

class DefaultUserAvatar extends StatelessWidget {
  const DefaultUserAvatar({Key? key, required this.id, required this.tagId})
      : super(key: key);
  final String id;
  final String tagId;
  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: tagId,
        child: CachedNetworkImage(
          imageUrl: id,
          imageBuilder: (context, imageProvider) => Container(
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
            ),
          ),
          placeholder: (context, url) => const DefaultLoadingImage(),
          errorWidget: (context, url, error) => CachedNetworkImage(
              imageBuilder: (context, imageProvider) => Container(
                    width: 80.0,
                    height: 80.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover),
                    ),
                  ),
              imageUrl:
                  'https://res.cloudinary.com/luongvany/image/upload/v1656900571/Users/default_avatar_image.png'),
        ));
  }
}
