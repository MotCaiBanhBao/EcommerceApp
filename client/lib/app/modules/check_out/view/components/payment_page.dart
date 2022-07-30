import 'package:auto_route/auto_route.dart';
import 'package:client/app/components/loading_dialog.dart';
import 'package:client/app/modules/check_out/bloc/check_out_bloc.dart';
import 'package:client/app/routes/routes.gr.dart';
import 'package:client/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../components/default_button.dart';
import '../../cubit/checkout_cubit.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final addresssController = TextEditingController();
  final phoneNumberController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    addresssController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CheckOutBloc, CheckOutState>(
      listenWhen: (previous, current) =>
          previous.status != current.status || previous.order != current.order,
      listener: (context, state) {
        if (state.status.isLoadding) {
          LoadingDialog.show(context);
        } else if (state.status.isCheckoutSuccess) {
          LoadingDialog.hide(context);
          AutoRouter.of(context).push(const SuccessRoute());
        } else if (state.status.isFailure) {
          LoadingDialog.hide(context);
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              content: Text(
                'SomeThingError',
              ),
            ));
        } else {
          LoadingDialog.hide(context);
        }
        // addresssController.text = state.order?.address ?? '';
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: getProportionateScreenHeight(400),
              child: Column(
                children: [
                  Row(
                    children: [
                      Checkbox(value: true, onChanged: (value) => {}),
                      const Expanded(child: Text('Thanh toán khi nhận hàng')),
                    ],
                  ),
                  GestureDetector(
                    onTap: (() {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Hiện ứng dụng chưa hỗ trợ')));
                    }),
                    child: Row(
                      children: const [
                        Checkbox(value: false, onChanged: null),
                        Expanded(
                          child: Text('Thanh toán bằng thẻ'),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (() {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Hiện ứng dụng chưa hỗ trợ')));
                    }),
                    child: Row(
                      children: const [
                        Checkbox(value: false, onChanged: null),
                        Expanded(
                          child: Text(
                              'YShop nhận hộ, bạn vui lòng liên hệ với shop'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: getProportionateScreenWidth(15),
                horizontal: getProportionateScreenWidth(30),
              ),
              // height: 174,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, -15),
                    blurRadius: 20,
                    color: const Color(0xFFDADADA).withOpacity(0.15),
                  )
                ],
              ),
              child: SafeArea(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: getProportionateScreenWidth(100),
                          child: DefaultButton(
                            text: "<",
                            press: () {
                              context.read<CheckoutCubit>().stepCancelled();
                            },
                          ),
                        ),
                        SizedBox(
                          width: getProportionateScreenWidth(100),
                          child: DefaultButton(
                            text: "Go",
                            press: () {
                              context
                                  .read<CheckOutBloc>()
                                  .add(const CheckOutEvent.checkOut());
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
