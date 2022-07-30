import 'package:client/app/components/loading_dialog.dart';
import 'package:client/app/modules/check_out/bloc/check_out_bloc.dart';
import 'package:client/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../components/default_button.dart';
import '../../cubit/checkout_cubit.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
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
        } else {
          LoadingDialog.hide(context);
        }

        addresssController.text = state.order?.shippingAdress.address ?? '';
        phoneNumberController.text =
            state.order?.shippingAdress.phoneNumber ?? '';
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
                      Expanded(
                        child: TextFormField(
                          controller: addresssController,
                          decoration:
                              const InputDecoration(hintText: 'address'),
                          onChanged: (value) {
                            context
                                .read<CheckOutBloc>()
                                .add(CheckOutEvent.onAddAddress(value));
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                      ),
                      IconButton(
                          onPressed: (() {
                            context
                                .read<CheckOutBloc>()
                                .add(const CheckOutEvent.autoLocation());
                          }),
                          icon: const Icon(
                            Icons.location_on,
                            color: Colors.red,
                          )),
                    ],
                  ),
                  TextFormField(
                    controller: phoneNumberController,
                    decoration: const InputDecoration(hintText: 'phone number'),
                    onChanged: (value) {
                      context
                          .read<CheckOutBloc>()
                          .add(CheckOutEvent.onAddPhoneNumber(value));
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
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
                            text: ">",
                            press: () {
                              context.read<CheckoutCubit>().stepContinued();
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
