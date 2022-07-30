import 'package:auto_route/auto_route.dart';
import 'package:client/app/components/loading_dialog.dart';
import 'package:client/app/routes/routes.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../size_config.dart';
import '../../../../helper/constants.dart';
import '../../../../routes/routes.gr.dart';
import '../../bloc/find_product_bloc.dart';

class RecentSearch extends StatelessWidget {
  const RecentSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FindProductBloc, FindProductState>(
      listener: (context, state) {
        // if (state.status.isLoadding) {
        //   LoadingDialog.show(context);
        // }
        // LoadingDialog.hide(context);
      },
      builder: (context, state) {
        return Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            // child: ListView.builder(
            //     shrinkWrap: true,
            //     itemCount: 3,
            //     itemBuilder: (BuildContext context, int index) {
            //       return ListTile(
            //           leading: SvgPicture.asset('assets/icons/recent.svg'),
            //           trailing: SvgPicture.asset('assets/icons/arrow_up.svg'),
            //           title: Text(
            //             testData[index],
            //             style: TextStyle(fontSize: 15),
            //           ));
            //     }),
            child: MasonryGridView.count(
              primary: false,
              shrinkWrap: true,
              itemCount: state.searchHis?.length ?? 0,
              // the number of columns
              crossAxisCount: 1,
              // vertical gap between two items
              mainAxisSpacing: getProportionateScreenWidth(10) * 1.2,
              // horizontal gap between two items
              crossAxisSpacing: getProportionateScreenWidth(10) * 1.2,
              itemBuilder: (context, index) {
                // display each item with a card
                return ListTile(
                    onTap: () {
                      AutoRouter.of(context).push(ResultWrapperRoute(
                          dataSearch: state.searchHis![index].searchData));
                    },
                    leading: SvgPicture.asset(
                      color: Colors.grey,
                      'assets/icons/recent.svg',
                      height: 20,
                      width: 20,
                    ),
                    trailing: SvgPicture.asset(
                      color: Colors.grey,
                      'assets/icons/arrow_up.svg',
                      height: 30,
                      width: 30,
                    ),
                    title: Text(
                      state.searchHis![index].searchData,
                      style: TextStyle(fontSize: 15),
                    ));
              },
            ));
      },
    );
  }
}
