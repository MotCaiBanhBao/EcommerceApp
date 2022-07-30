import 'package:auth_api/auth_api.dart';
import 'package:auth_repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:product_api/product_api.dart';
import 'package:products_repository/products_repository.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';
part 'dashboard_bloc.freezed.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc(this._productRepository, this._authRepository)
      : super(_Initial()) {
    on<_Started>(_onStarted);
  }
  final ProductsRepository _productRepository;
  final AuthRepository _authRepository;

  Future<void> _onStarted(_Started event, Emitter<DashboardState> emit) async {
    print("rrrun");
    emit(state.copyWith(status: DashBoardStatus.loading));

    try {
      final products = _productRepository.getProducts();
      // final login =
      //     _authRepository.login('luongvany2011@gmail.com', '123456789');

      // final login = _authRepository.otpVerify(
      //     'luongvany2011@gmail.com',
      //     '6d2c61202b6e2d414906d70a7f038a5d5425e18e49f352e3959e85c859470cae.1655064718653',
      //     '9084');

      emit(
        state.copyWith(
          status: DashBoardStatus.success,
          popularProduct: await products,
        ),
      );
    } on Exception catch (error, stackTrace) {
      // notify the bloc observer
      addError(error, stackTrace);
      emit(state.copyWith(status: DashBoardStatus.failure));
    }
  }
}
