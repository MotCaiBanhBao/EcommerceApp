import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:product_api/product_api.dart';
import 'package:products_repository/products_repository.dart';

part 'result_product_event.dart';
part 'result_product_state.dart';
part 'result_product_bloc.freezed.dart';

class ResultProductBloc extends Bloc<ResultProductEvent, ResultProductState> {
  ResultProductBloc(this._productsRepository) : super(_Initial()) {
    on<_Started>(_onStarted);
  }

  ProductsRepository _productsRepository;

  Future<void> _onStarted(_Started event, Emitter emit) async {
    try {
      emit(state.copyWith(status: ResultPageStatus.loading));

      final products = await _productsRepository.findProduct(event.data);
      // final login =
      //     _authRepository.login('luongvany2011@gmail.com', '123456789');

      // final login = _authRepository.otpVerify(
      //     'luongvany2011@gmail.com',
      //     '6d2c61202b6e2d414906d70a7f038a5d5425e18e49f352e3959e85c859470cae.1655064718653',
      //     '9084');
      print(products);
      emit(
        state.copyWith(findProduct: products, status: ResultPageStatus.success),
      );
    } on Exception catch (error, stackTrace) {
      // notify the bloc observer
      addError(error, stackTrace);
      emit(state.copyWith(status: ResultPageStatus.failure));
    }
  }
}
