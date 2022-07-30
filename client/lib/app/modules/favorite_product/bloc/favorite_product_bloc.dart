import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:product_api/product_api.dart';
import 'package:products_repository/products_repository.dart';

part 'favorite_product_event.dart';
part 'favorite_product_state.dart';
part 'favorite_product_bloc.freezed.dart';

class FavoriteProductBloc
    extends Bloc<FavoriteProductEvent, FavoriteProductState> {
  FavoriteProductBloc(this._productsRepository) : super(_Initial()) {
    on<_Started>(_onStart);
  }

  Future<void> _onStart(
      _Started event, Emitter<FavoriteProductState> emit) async {
    emit(state.copyWith(status: FavoriteProductStatus.loading));
    await _productsRepository.getFavoriteItem().then((value) async {
      if (value != null) {
        emit(state.copyWith(
          favoriteProduct: value,
          status: FavoriteProductStatus.successs,
        ));
      } else {
        emit(state.copyWith(status: FavoriteProductStatus.failure));
      }
    });
  }

  final ProductsRepository _productsRepository;
}
