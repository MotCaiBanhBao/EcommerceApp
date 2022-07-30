part of 'review_product_bloc.dart';

@freezed
class ReviewProductEvent with _$ReviewProductEvent {
  const factory ReviewProductEvent.submit(String comment, int star) = _Submit;
}
