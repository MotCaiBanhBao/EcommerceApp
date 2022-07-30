part of 'result_product_bloc.dart';

@freezed
class ResultProductEvent with _$ResultProductEvent {
  const factory ResultProductEvent.started(String data) = _Started;
}
