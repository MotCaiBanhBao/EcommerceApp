import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../size_config.dart';
import '../helper/constants.dart';
import '../modules/dashboard/views/components/section_title.dart';

class CategoryPanel extends StatelessWidget {
  const CategoryPanel({Key? key, required this.title, required this.onPress})
      : super(key: key);
  final String title;
  final Function() onPress;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultPadding),
          child: SectionTitle(title: title, press: onPress),
        ),
        SizedBox(height: defaultPadding),
      ],
    );
  }
}
