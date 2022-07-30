import 'package:bloc/bloc.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:product_api/product_api.dart';
import 'package:products_repository/products_repository.dart';
import 'dart:io' as io;

part 'shop_products_event.dart';
part 'shop_products_state.dart';
part 'shop_products_bloc.freezed.dart';

class ShopProductsBloc extends Bloc<ShopProductsEvent, ShopProductsState> {
  ShopProductsBloc(this._productsRepository) : super(_Initial()) {
    on<_Started>(_onStarted);
    on<_AddProduct>(_onSaveProduct);
    on<_DeleteProduct>(_onDeleteProduct);
  }

  Future<void> _onDeleteProduct(_DeleteProduct event, Emitter emit) async {
    final id = event.id;

    try {
      emit(state.copyWith(status: ShopProductsStatus.loading));

      await _productsRepository.deleteProduct(id).then((value) {
        if (value == false) {
          emit(state.copyWith(status: ShopProductsStatus.failure));
        } else {
          emit(state.copyWith(status: ShopProductsStatus.actionSuccess));
        }
      });
    } on Exception catch (error, stackTrace) {
      addError(error, stackTrace);
      emit(state.copyWith(status: ShopProductsStatus.failure));
    }
  }

  final ProductsRepository _productsRepository;
  Future<void> _onSaveProduct(_AddProduct event, Emitter emit) async {
    final avatar = event.avatar;
    final productImage = event.productImage;
    final address = event.address;
    final title = event.title;
    final description = event.description;
    final price = event.price;
    final stock = event.stock;
    final category = event.category;
    final variations = event.variations;
    final shippingDetails = event.shippingDetails;

    final fileAvatar = io.File(avatar.path);
    final fileProductImg =
        productImage.map((item) => io.File(avatar.path)).toList();

    try {
      emit(state.copyWith(status: ShopProductsStatus.loading));

      await _productsRepository
          .saveProduct(fileAvatar, fileProductImg, address, title, description,
              price, stock, category, variations, shippingDetails)
          .then((value) {
        if (value == false) {
          emit(state.copyWith(status: ShopProductsStatus.failure));
        } else {
          emit(
              state.copyWith(status: ShopProductsStatus.needBackActionSuccess));
        }
      });
    } on Exception catch (error, stackTrace) {
      addError(error, stackTrace);
      emit(state.copyWith(status: ShopProductsStatus.failure));
    }
  }

  Future<void> _onStarted(_Started event, Emitter emit) async {
    try {
      emit(state.copyWith(status: ShopProductsStatus.loading));

      await _productsRepository.getShopProducts().then((value) {
        if (value == null) {
          emit(state.copyWith(status: ShopProductsStatus.failure));
        } else {
          emit(state.copyWith(
              status: ShopProductsStatus.success, shopProduct: value));
        }
      });
    } on Exception catch (error, stackTrace) {
      addError(error, stackTrace);
      emit(state.copyWith(status: ShopProductsStatus.failure));
    }
  }
}
