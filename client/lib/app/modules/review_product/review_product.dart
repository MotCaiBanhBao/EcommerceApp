import 'dart:math';

import 'package:auth_repository/auth_repository.dart';
import 'package:auto_route/auto_route.dart';
import 'package:client/app/modules/reset_password/bloc/reset_password_bloc.dart';
import 'package:client/app/modules/review_product/bloc/review_product_bloc.dart';
import 'package:client/app/modules/shop_products/bloc/shop_products_bloc.dart';
import 'package:client/app/modules/shop_products/views/components/shop_product_page.dart';
import 'package:client/app/modules/shop_register/bloc/shop_register_bloc.dart';
import 'package:client/app/routes/routes.gr.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:products_repository/products_repository.dart';

import '../../../../translations/locale_keys.g.dart';
import '../../components/loading_dialog.dart';

class ReviewProductWrapperScreen extends StatelessWidget {
  ReviewProductWrapperScreen({Key? key, required this.productID})
      : super(key: key);
  String productID;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReviewProductBloc(
        context.read<ProductsRepository>(),
        productID,
      ),
      child: const AutoRouter(),
    );
  }
}

class ReviewProductScreen extends StatefulWidget {
  const ReviewProductScreen({Key? key}) : super(key: key);
  @override
  State<ReviewProductScreen> createState() {
    return _ResetPasswordForm();
  }
}

class _ResetPasswordForm extends State<ReviewProductScreen> {
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  final _formKey = GlobalKey<FormBuilderState>();
  double _rating = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ReviewProductBloc, ReviewProductState>(
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
          context.router.pop();
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
                      'comment': '',
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
                        RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            setState(() {
                              _rating = rating;
                            });
                          },
                        ),
                        const SizedBox(height: 15),
                        FormBuilderTextField(
                          autovalidateMode: AutovalidateMode.always,
                          name: 'comment',
                          decoration: InputDecoration(
                            labelText: 'Comment',
                          ),
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
                              final comment =
                                  _formKey.currentState?.value['comment'];
                              context.read<ReviewProductBloc>().add(
                                  ReviewProductEvent.submit(
                                      comment, _rating.toInt()));
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
