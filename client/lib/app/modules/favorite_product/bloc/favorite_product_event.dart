part of 'favorite_product_bloc.dart';

@freezed
class FavoriteProductEvent with _$FavoriteProductEvent {
  const factory FavoriteProductEvent.started() = _Started;
}