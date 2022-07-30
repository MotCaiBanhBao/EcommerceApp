part of 'result_product_bloc.dart';

enum ResultPageStatus {
  initial,
  loading,
  success,
  failure;

  bool get isInitial => this == ResultPageStatus.initial;
  bool get isLoading => this == ResultPageStatus.loading;
  bool get isSuccess => this == ResultPageStatus.success;
  bool get isFailure => this == ResultPageStatus.failure;
}

@freezed
class ResultProductState with _$ResultProductState {
  const factory ResultProductState(
      {@Default(ResultPageStatus.initial) ResultPageStatus status,
      @Default(null) ListProductResponse? findProduct}) = _Initial;
}
