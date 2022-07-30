part of 'detail_bloc.dart';

@freezed
class DetailEvent with _$DetailEvent {
  const factory DetailEvent.started() = _Started;
  const factory DetailEvent.onAddToCart() = _OnAddToCart;
  const factory DetailEvent.addFavorite() = _AddFavorite;
  const factory DetailEvent.onSelectedChip(
      VariationsData data, List<VariationsData> category) = _OnSelectedChip;
}
