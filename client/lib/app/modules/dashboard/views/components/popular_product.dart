import 'package:client/app/components/default_list_loading_card.dart';
import 'package:client/app/modules/dashboard/bloc/dashboard_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../size_config.dart';
import '../../../../components/default_loading_image.dart';
import '../../../../components/product_card.dart';
import '../../../../helper/constants.dart';
import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        return Column(children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            child: SectionTitle(title: "Popular Products", press: () {}),
          ),
          SizedBox(height: defaultPadding),
          state.status.isSuccess
              ? SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                        context.select((DashboardBloc bloc) =>
                            state.popularProduct!.productList?.length ?? 0),
                        (index) {
                          // if (demoProducts[index].isPopular)
                          return ProductCard(
                              product:
                                  state.popularProduct!.productList![index]);
                          // return SizedBox
                          //     .shrink(); // here by default width and height is 0
                        },
                      ),
                      SizedBox(width: defaultPadding),
                    ],
                  ),
                )
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: const DefaultListLoadingCard(crossAxisCount: 2, itemCount: 2,),
                  // child: Shimmer.fromColors(
                  //   baseColor: Colors.grey[300]!,
                  //   highlightColor: Colors.grey[100]!,
                  //   child: MasonryGridView.count(
                  //     primary: false,
                  //     shrinkWrap: true,
                  //     itemCount: 2,
                  //     // the number of columns
                  //     crossAxisCount: 2,
                  //     // vertical gap between two items
                  //     mainAxisSpacing: getProportionateScreenWidth(10) * 1.2,
                  //     // horizontal gap between two items
                  //     crossAxisSpacing: getProportionateScreenWidth(10) * 1.2,
                  //     itemBuilder: (context, index) {
                  //       return const DefaultLoadingImage();
                  //     },
                  //   ),
                  // ),
                ),
        ]);
      },
    ); // : const CircularProgressIndicator();
  }
}
