part of 'cart_bloc.dart';

@freezed
class CartEvent with _$CartEvent {
  const factory CartEvent.started() = _Started;
  const factory CartEvent.delete(String id, String publisher) = _Delete;
  const factory CartEvent.updateQuantity(
      int counter, String id, String publisher) = _UpdateQuantity;

  const factory CartEvent.updateChoose(
      bool isCheck, String id, String publisher) = _UpdateChoose;
}
