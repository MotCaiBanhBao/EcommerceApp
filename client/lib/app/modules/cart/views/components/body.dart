import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../size_config.dart';
import '../../../../helper/constants.dart';
import '../../../dashboard/views/components/section_title.dart';
import '../../bloc/cart_bloc.dart';
import 'cart_card.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.cartData?.items.length,
          itemBuilder: (context, index) => Container(
            color: Colors.grey[100],
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: SvgPicture.asset(
                            'assets/icons/Shop Icon.svg',
                          ),
                        ),
                        Text(
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.headline6,
                            state.cartData?.items[index].publisherId ?? 'Test'),
                      ],
                    ),
                  ),
                  const Divider(height: 10.0, thickness: 1.0),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:
                        state.cartData?.items[index].productItems.length ?? 0,
                    itemBuilder: (context, item) => Padding(
                      padding: const EdgeInsets.only(bottom: 5.0, top: 5.0),
                      child: Slidable(
                        // Specify a key if the Slidable is dismissible.
                        key: const ValueKey(0),
                        // The start action pane is the one at the left or the top side.
                        endActionPane: ActionPane(
                          // A motion is a widget used to control how the pane animates.
                          motion: const ScrollMotion(),

                          // A pane can dismiss the Slidable.
                          // dismissible: DismissiblePane(onDismissed: () {
                          //   print('dismiss');
                          // }),

                          // All actions are defined in the children parameter.
                          children: [
                            // A SlidableAction can have an icon and/or a label.
                            SlidableAction(
                              onPressed: ((context) {
                                var slide = Slidable.of(context);
                                slide!.close();
                                context.read<CartBloc>().add(CartEvent.delete(
                                    state.cartData!.items[index]
                                        .productItems[item].id,
                                    state.cartData!.items[index]
                                            .productItems[item].publisherId ??
                                        ''));
                              }),
                              backgroundColor: Color(0xFFFE4A49),
                              foregroundColor: Colors.white,
                              icon: Icons.delete,
                              label: 'Delete',
                            ),
                            SlidableAction(
                              onPressed: ((context) => {print('share')}),
                              backgroundColor: Colors.pink,
                              foregroundColor: Colors.white,
                              icon: Icons.favorite,
                              label: 'Favorite',
                            ),
                          ],
                        ),
                        // The child of the Slidable is what the user sees when the
                        // component is not dragged.
                        child: CartCard(
                            productItem: state
                                .cartData!.items[index].productItems[item]),
                      ),
                    ),
                  ),
                  
                ],
              ),
            ),
            // child:
          ),
        );
      },
    );
  }
}
