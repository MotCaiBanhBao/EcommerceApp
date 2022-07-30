part of 'find_product_bloc.dart';

@freezed
class FindProductEvent with _$FindProductEvent {
  const factory FindProductEvent.started() = _Started;
  const factory FindProductEvent.goSearch(String searchData) = _GoSearch;
  const factory FindProductEvent.getFindProduct() = _GetFindProduct;
  const factory FindProductEvent.onSpeechResult(String result) =
      _OpenSpeechToText;
}
