import 'package:client/app/modules/shop_products/bloc/shop_products_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:product_api/product_api.dart';

class FormProductScreen extends StatefulWidget {
  const FormProductScreen({Key? key, this.init}) : super(key: key);
  final ProductModel? init;
  @override
  State<FormProductScreen> createState() {
    return _EditProductState();
  }
}

class _EditProductState extends State<FormProductScreen> {
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
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
                  'title': widget.init?.title ?? '',
                  'description': widget.init?.description ?? '',
                  'price': (widget.init?.price ?? '').toString(),
                  'address': widget.init?.address ?? '',
                  'stock': (widget.init?.stock ?? '').toString(),
                  'shipping_detail': widget.init?.address ?? '',
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
                    FormBuilderImagePicker(
                      name: 'avatar',
                      decoration: const InputDecoration(
                          labelText: 'Pick Product Avatar'),
                      maxImages: 1,
                      initialValue:
                          widget.init != null ? [widget.init!.avatar!] : [],
                    ),
                    const SizedBox(height: 15),
                    FormBuilderImagePicker(
                      name: 'productImage',
                      decoration: const InputDecoration(
                          labelText: 'Pick Product Image'),
                      maxImages: 10,
                      initialValue:
                          widget.init != null ? widget.init!.productImage! : [],
                    ),
                    const SizedBox(height: 15),
                    FormBuilderTextField(
                      autovalidateMode: AutovalidateMode.always,
                      name: 'title',
                      decoration: InputDecoration(
                        labelText: 'Title',
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 15),
                    FormBuilderTextField(
                      autovalidateMode: AutovalidateMode.always,
                      name: 'description',
                      decoration: InputDecoration(
                        labelText: 'Description',
                      ),
                      onChanged: (val) {
                        setState(() {
                          print((_formKey.currentState?.fields['age']));
                        });
                      },
                      // valueTransformer: (text) => num.tryParse(text),
                      // initialValue: '12',
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 15),
                    FormBuilderTextField(
                      autovalidateMode: AutovalidateMode.always,
                      name: 'price',
                      decoration: InputDecoration(
                        labelText: 'Price',
                      ),
                      // valueTransformer: (text) => num.tryParse(text),
                      // initialValue: '12',
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 15),
                    FormBuilderTextField(
                      autovalidateMode: AutovalidateMode.always,
                      name: 'address',
                      decoration: InputDecoration(
                        labelText: 'Adress',
                      ),
                      // valueTransformer: (text) => num.tryParse(text),
                      // initialValue: '12',

                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 15),
                    FormBuilderTextField(
                      autovalidateMode: AutovalidateMode.always,
                      name: 'stock',
                      decoration: InputDecoration(
                        labelText: 'Stock',
                      ),
                      // valueTransformer: (text) => num.tryParse(text),
                      // initialValue: '12',
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(height: 15),
                    FormBuilderTextField(
                      autovalidateMode: AutovalidateMode.always,
                      name: 'shipping_detail',
                      decoration: InputDecoration(
                        labelText: 'Shipping detail',
                      ),
                      // valueTransformer: (text) => num.tryParse(text),
                      // initialValue: '12',

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
                        if (_formKey.currentState?.saveAndValidate() == true) {
                          final producImage = _formKey
                              .currentState?.value['productImage']
                              .cast<XFile>();
                          context.read<ShopProductsBloc>().add(
                              ShopProductsEvent.addProduct(
                                  _formKey.currentState?.value['avatar'][0]
                                      as XFile,
                                  producImage,
                                  _formKey.currentState?.value['address'],
                                  _formKey.currentState?.value['title'],
                                  _formKey.currentState?.value['description'],
                                  _formKey.currentState?.value['price'],
                                  '62c3d3c63fbf5b8cd59426a7',
                                  '',
                                  _formKey.currentState?.value['stock'],
                                  _formKey
                                      .currentState?.value['shipping_detail']));
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
  }
}
