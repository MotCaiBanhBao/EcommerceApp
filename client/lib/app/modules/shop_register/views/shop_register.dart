import 'dart:math';

import 'package:auth_repository/auth_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:client/app/modules/shop_products/bloc/shop_products_bloc.dart';
import 'package:client/app/modules/shop_products/views/components/shop_product_page.dart';
import 'package:client/app/modules/shop_register/bloc/shop_register_bloc.dart';
import 'package:client/app/routes/routes.gr.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:products_repository/products_repository.dart';

import '../../../../translations/locale_keys.g.dart';
import '../../../components/loading_dialog.dart';
import '../../../components/rounded_icon_btn.dart';

class ShopRegisterWrapperScreen extends StatelessWidget {
  const ShopRegisterWrapperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopRegisterBloc(
        context.read<AuthRepository>(),
      ),
      child: const AutoRouter(),
    );
  }
}

class ShopRegisterScreen extends StatefulWidget {
  const ShopRegisterScreen({Key? key}) : super(key: key);
  @override
  State<ShopRegisterScreen> createState() {
    return _ShopForm();
  }
}

class _ShopForm extends State<ShopRegisterScreen> {
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopRegisterBloc, ShopRegisterState>(
      listenWhen: (previous, current) => previous.status != current.status,
      listener: (context, state) {
        if (state.status.isLoading) {
          LoadingDialog.show(context);
        } else if (state.status.isActionSuccess) {
          LoadingDialog.hide(context);
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              content: Text(
                'Thành công',
              ),
            ));
          context.router.popUntilRoot();
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
        return Scaffold(
          appBar: AppBar(title: const Text('Form')),
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  FormBuilder(
                    key: _formKey,
                    // enabled: false,
                    onChanged: () {
                      _formKey.currentState!.save();
                      debugPrint(_formKey.currentState!.value.toString());
                    },
                    autovalidateMode: AutovalidateMode.disabled,
                    initialValue: {
                      'address': '',
                      'phoneNumber': '',
                      'shopName': '',
                    },

                    //          const avatar = req.files.avatar
                    // const productImage = req.files.productImage
                    // const address = req.body.address
                    // const title = req.body.title
                    // const description = req.body.description
                    // const price = req.body.price
                    // const stock = req.body.stock
                    // const category = req.body.category
                    // const variations = req.body.variations
                    // const shipping_details = req.body.shipping_details
                    skipDisabled: true,
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 15),
                        FormBuilderTextField(
                          autovalidateMode: AutovalidateMode.always,
                          name: 'shopName',
                          decoration: InputDecoration(
                            labelText: 'Shop Name',
                          ),
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(height: 15),
                        FormBuilderTextField(
                          autovalidateMode: AutovalidateMode.always,
                          name: 'address',
                          decoration: InputDecoration(
                            labelText: 'Address',
                          ),
                          // valueTransformer: (text) => num.tryParse(text),
                          // initialValue: '12',
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(height: 15),
                        FormBuilderTextField(
                          autovalidateMode: AutovalidateMode.always,
                          name: 'phoneNumber',
                          decoration: InputDecoration(
                            labelText: 'Phone Number',
                          ),
                          // valueTransformer: (text) => num.tryParse(text),
                          // initialValue: '12',
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState?.saveAndValidate() ==
                                true) {
                              final address =
                                  _formKey.currentState?.value['address'];
                              final phoneNumber =
                                  _formKey.currentState?.value['phoneNumber'];
                              final shopName =
                                  _formKey.currentState?.value['shopName'];
                              context.read<ShopRegisterBloc>().add(
                                  ShopRegisterEvent.submit(
                                      address, phoneNumber, shopName));
                            }
                          },
                          child: const Text(
                            'Submit',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            _formKey.currentState?.reset();
                          },
                          // color: Theme.of(context).colorScheme.secondary,
                          child: Text(
                            'Reset',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
