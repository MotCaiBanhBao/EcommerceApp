import 'package:auth_repository/auth_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:client/app/modules/favorite_product/bloc/favorite_product_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:product_api/product_api.dart';
import 'package:products_repository/products_repository.dart';

import '../../../size_config.dart';
import '../../components/product_expanded_card.dart';
import '../../components/rounded_icon_btn.dart';
import '../../helper/constants.dart';
import '../../routes/routes.gr.dart';

class FavoriteWrapperScreen extends StatelessWidget {
  const FavoriteWrapperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            FavoriteProductBloc(context.read<ProductsRepository>())
              ..add(const FavoriteProductEvent.started()),
        child: const AutoRouter(),
      ),
    );
  }
}

class FavoriteProductScreen extends StatelessWidget {
  const FavoriteProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteProductBloc, FavoriteProductState>(
        builder: (context, state) => (
      Scaffold(
        floatingActionButton: RoundedIconBtn(
          icon: Icons.refresh,
          showShadow: true,
          press: () {
            context
                .read<FavoriteProductBloc>()
                .add(FavoriteProductEvent.started());
          },
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: false,
          title: Text(
            "Favorites",
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: state.favoriteProduct != null
                    ? Column(children: [
                        SizedBox(height: getProportionateScreenHeight(20)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Chip(label: Text('Phổ biến')),
                            Chip(label: Text('Bán chạy')),
                            Chip(label: Text('Giá giảm')),
                            Chip(label: Text('Giá tăng')),
                          ],
                        ),
                        SizedBox(height: getProportionateScreenHeight(20)),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: defaultPadding),
                          child: MasonryGridView.count(
                            primary: false,
                            shrinkWrap: true,
                            itemCount: 2,
                            // the number of columns
                            crossAxisCount: 2,
                            // vertical gap between two items
                            mainAxisSpacing:
                                getProportionateScreenWidth(10) * 1.2,
                            // horizontal gap between two items
                            crossAxisSpacing:
                                getProportionateScreenWidth(10) * 1.2,
                            itemBuilder: (context, index) {
                              // display each item with a card
                              return ProductExpandedCard(
                                  data: state.favoriteProduct![index]);
                            },
                          ),
                        )
                      ])
                    : Column(
                        children: [
                          Center(
                            child: Text('No item'),
                          )
                        ],
                      )),
          )
      ))
    );
  }
}
