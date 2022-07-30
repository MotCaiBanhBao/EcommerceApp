import 'package:cached_network_image/cached_network_image.dart';
import 'package:client/app/components/default_image.dart';
import 'package:flutter/material.dart';

import '../../../../helper/constants.dart';
import '../../../../../size_config.dart';

class ProductImages extends StatefulWidget {
  const ProductImages({
    Key? key,
    required this.imageProduct,
  }) : super(key: key);

  final List<String> imageProduct;

  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(238),
          child: AspectRatio(
              aspectRatio: 1,
              child: DefaultInternetImage(
                imageUri: widget.imageProduct[selectedImage],
                tagId: '0',
              )),
        ),
        // SizedBox(height: defaultPadding),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(widget.imageProduct.length,
                (index) => buildSmallProductPreview(index)),
          ],
        )
      ],
    );
  }

  GestureDetector buildSmallProductPreview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: AnimatedContainer(
        duration: defaultDuration,
        margin: const EdgeInsets.only(right: 15),
        padding: const EdgeInsets.all(8),
        height: getProportionateScreenWidth(48),
        width: getProportionateScreenWidth(48),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: Theme.of(context)
                  .primaryColor
                  .withOpacity(selectedImage == index ? 1 : 0)),
        ),
        child: DefaultInternetImage(
          imageUri: widget.imageProduct[index],
          tagId: widget.imageProduct[index],
        ),
      ),
    );
  }
}
