import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:cart_repository/cart_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:product_api/product_api.dart';
import 'package:products_repository/products_repository.dart';
import 'package:remote_products_api/products_api.dart';

import '../../cart/bloc/cart_bloc.dart';
part 'detail_event.dart';
part 'detail_state.dart';
part 'detail_bloc.freezed.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc(ProductModel data, this._productRepository, num price,
      this._cartRepository, this._authRepository)
      : super(_Initial(data: data, price: price)) {
    on<_Started>(_onStart);
    on<_OnSelectedChip>(_onSelectedChip);
    on<_OnAddToCart>(_onAddCart);
    on<_AddFavorite>(_addFavorite);
  }

  final ProductsRepository _productRepository;
  final CartRepository _cartRepository;
  final AuthRepository _authRepository;

  Future<void> _onAddCart(_OnAddToCart event, Emitter<DetailState> emit) async {
    try {
      emit(state.copyWith(addCartStatus: AddToCartStatus.loading));
      await _cartRepository
          .saveCartItem(ProductItem(
              stock: state.data!.stock?.toInt(),
              publisherId: state.data!.publisher,
              variationData: _getVariationsID(state.choiceChip,
                          state.data?.variations?.combineData) !=
                      null
                  ? state.choiceChip.map((e) => e.name!).toString()
                  : null,
              productImage:
                  _getProductID(state.choiceChip) ?? state.data?.avatar,
              name: state.data?.title ?? '',
              price: state.price,
              productId: state.data?.id,
              quantity: 1,
              variation: _getVariationsID(
                  state.choiceChip, state.data?.variations?.combineData)))
          .then((value) =>
              emit(state.copyWith(addCartStatus: AddToCartStatus.success)));
    } on Exception catch (error, stackTrace) {
      print('errer');
      emit(state.copyWith(addCartStatus: AddToCartStatus.failure));
      addError(error, stackTrace);
    }
  }

  Future<void> _onSelectedChip(
      _OnSelectedChip event, Emitter<DetailState> emit) async {
    var data = List<VariationsData>.from(state.choiceChip);
    try {
      if (state.choiceChip.contains(event.data)) {
        data.remove(event.data);
      } else {
        data.removeWhere((element) => event.category.contains(element));
        data.add(event.data);
        // emit(state.copyWith(choiceChip: ));
      }
      final priceResult = _getPrice(data, state.data!.variations!.combineData!);
      emit(state.copyWith(
          choiceChip: data, price: priceResult ?? state.data!.price!));
    } on Exception catch (error, stackTrace) {
      // notify the bloc observer
      print('errer');
      addError(error, stackTrace);
    }
  }

  String? _getVariationsID(
      List<VariationsData> choicedChip, List<CombineData>? combine) {
    for (var item in combine!) {
      Function unOrdDeepEq = const DeepCollectionEquality.unordered().equals;
      if (unOrdDeepEq(
          item.combine!, choicedChip.map((e) => e.toString()).toList())) {
        return item.id;
      }
    }
    return null;
  }

  String? _getProductID(List<VariationsData> variationsData) {
    for (var item in variationsData) {
      if (item.productImage != null) {
        return item.productImage!;
      }
    }
    return null;
  }

  num? _getPrice(List<VariationsData> choicedChip, List<CombineData>? combine) {
    for (var item in combine!) {
      print(item.combine!);
      print(choicedChip.map((e) => e.toString()).toList());
      Function unOrdDeepEq = const DeepCollectionEquality.unordered().equals;
      if (unOrdDeepEq(
          item.combine!, choicedChip.map((e) => e.toString()).toList())) {
        print(item.price!);
        return item.price!;
      }
    }
    return null;
  }

  Future<void> _addFavorite(
      _AddFavorite event, Emitter<DetailState> emit) async {
    emit(state.copyWith(status: DetailStatus.actionLoading));
    await _authRepository
        .setFavorite(!state.isFavorite, state.data!.id!)
        .then((value) async {
      if (value) {
        emit(state.copyWith(
          isFavorite: !state.isFavorite,
          status: DetailStatus.actionSuccess,
        ));
      } else {
        emit(state.copyWith(status: DetailStatus.failure));
        debugPrint("Error");
      }
    });
  }

  Future<void> _onStart(_Started event, Emitter<DetailState> emit) async {
    emit(state.copyWith(status: DetailStatus.loading));
    await _productRepository.getProduct(state.data!.id!).then((value) async {
      if (value!.isSuccess) {
        await _authRepository.isFavorite(state.data!.id!).then((isfavorite) => {
              emit(state.copyWith(
                isFavorite: isfavorite,
                data: value.product,
                status: DetailStatus.success,
              ))
            });
      } else {
        emit(state.copyWith(status: DetailStatus.failure));
        debugPrint("Error");
      }
    });
  }
}
