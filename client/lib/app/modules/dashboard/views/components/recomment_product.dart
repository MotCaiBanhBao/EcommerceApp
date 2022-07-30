import 'dart:math';

import 'package:client/app/components/default_list_loading_card.dart';
import 'package:client/app/components/product_expanded_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../size_config.dart';
import '../../../../helper/constants.dart';
import '../../bloc/dashboard_bloc.dart';

class RecommentProducts extends StatelessWidget {
  const RecommentProducts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
      return Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultPadding),
          child: state.status.isSuccess
              ? MasonryGridView.count(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: state.popularProduct!.productList?.length ?? 0,
                  // the number of columns
                  crossAxisCount: 2,
                  // vertical gap between two items
                  mainAxisSpacing: getProportionateScreenWidth(10) * 1.2,
                  // horizontal gap between two items
                  crossAxisSpacing: getProportionateScreenWidth(10) * 1.2,
                  itemBuilder: (context, index) {
                    // display each item with a card
                    return ProductExpandedCard(
                        data: state.popularProduct!.productList![index]);
                  },
                )
              :
              // display each item with a card
              const DefaultListLoadingCard(itemCount: 6, crossAxisCount: 2)
          // Shimmer.fromColors(
          //     baseColor: Colors.grey[300]!,
          //     highlightColor: Colors.grey[100]!,
          //     child: MasonryGridView.count(
          //       primary: false,
          //       shrinkWrap: true,
          //       itemCount: 6,
          //       // the number of columns
          //       crossAxisCount: 2,
          //       // vertical gap between two items
          //       mainAxisSpacing: getProportionateScreenWidth(10) * 1.2,
          //       // horizontal gap between two items
          //       crossAxisSpacing: getProportionateScreenWidth(10) * 1.2,
          //       itemBuilder: (context, index) {
          //         return Card(
          //           elevation: 1.0,
          //           shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(16),
          //           ),
          //           child: const SizedBox(height: 80),
          //         );
          //       },
          //     ),
          //   ),
          );

      // child: StaggeredGrid.count(
      //   crossAxisCount: chieurong, //Số cột sẽ xuất hiện
      //   mainAxisSpacing: 2, //vertical gap between two items
      //   crossAxisSpacing: 2, //horizontal gap between two items
      //   children: const [
      //     StaggeredGridTile.count(
      //       crossAxisCellCount: 1, //SO LUONG RONG
      //       mainAxisCellCount: 1.5, //SO LUONG CHIEU DAI
      //       child: TestCard(),
      //     ),
      //     StaggeredGridTile.count(
      //       crossAxisCellCount: 1,
      //       mainAxisCellCount: 1.5,
      //       child: TestCard(),
      //     ),
      //     StaggeredGridTile.count(
      //       crossAxisCellCount: 1,
      //       mainAxisCellCount: 1.5,
      //       child: TestCard(),
      //     ),
      //     StaggeredGridTile.count(
      //       crossAxisCellCount: 1,
      //       mainAxisCellCount: 1.5,
      //       child: TestCard(),
      //     )
      //     // StaggeredGridTile.count(
      //     //   crossAxisCellCount: 1,
      //     //   mainAxisCellCount: 1,
      //     //   child: TestCard(),
      //     // ),
      //     // StaggeredGridTile.count(
      //     //   crossAxisCellCount: 1,
      //     //   mainAxisCellCount: 1,
      //     //   child: TestCard(),
      //     // ),
      //     // StaggeredGridTile.count(
      //     //   crossAxisCellCount: 4,
      //     //   mainAxisCellCount: 2,
      //     //   child: TestCard(),
      //     // ),
      //   ],
      // ),
    });

    // return context.select((DashboardBloc bloc) => bloc.state.status.isSuccess)
    //     ? Container(
    //         color: Colors.grey[200],
    //         child: GridView(
    //           shrinkWrap: true,
    //           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //               crossAxisCount: 2),
    //           children: List.generate(
    //             5,
    //             (index) {
    //               return TestCard();
    //             },
    //           ),
    //         ))
    //     : const CircularProgressIndicator();
  } // : const CircularProgressIndicator();
}
