import 'package:auto_route/auto_route.dart';
import 'package:client/app/routes/routes.gr.dart';
import 'package:flutter/material.dart';

import '../../../../helper/constants.dart';
import '../../../../../size_config.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.6,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        onTap: () => AutoRouter.of(context).push(SearchPageWrapperRoute()),
        autofocus: false,
        readOnly: true,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: defaultPadding,
                vertical: getProportionateScreenWidth(20)),
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: "Search product",
            iconColor: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
            focusColor:
                Theme.of(context).colorScheme.secondary.withOpacity(0.1),
            prefixIconColor:
                Theme.of(context).colorScheme.secondary.withOpacity(0.1),
            suffixIconColor:
                Theme.of(context).colorScheme.secondary.withOpacity(0.1),
            suffixIcon: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // added line
              mainAxisSize: MainAxisSize.min, // added line
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.mic),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.camera_alt),
                  onPressed: () {},
                ),
              ],
            ),
            prefixIcon: Icon(Icons.search)),
      ),
    );
  }
}
