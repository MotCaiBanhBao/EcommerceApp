part of 'find_product_bloc.dart';

enum FindProStatus {
  initial,
  loading,
  success,
  failure,
  none;

  bool get isSuccess => this == FindProStatus.success;
  bool get isLoadding => this == FindProStatus.loading;
  bool get isInitial => this == FindProStatus.initial;
  bool get isFailure => this == FindProStatus.failure;
}

@freezed
class FindProductState with _$FindProductState {
  const factory FindProductState({
    @Default(null) List<SearchHistoryModel>? searchHis,
    @Default(FindProStatus.none) FindProStatus status,
    @Default('') String searchData,
    @Default(null) SpeechToText? speechToText,
  }) = _Initial;
}
