part of 'check_out_bloc.dart';

@freezed
class CheckOutEvent with _$CheckOutEvent {
  const factory CheckOutEvent.started(CartModel currentCart) = _Started;
  const factory CheckOutEvent.onAddAddress(String address) = _OnAddAddress;

  const factory CheckOutEvent.onAddPhoneNumber(String phoneNumber) =
      _OnAddPhoneNumber;
  const factory CheckOutEvent.autoLocation() = _AutoLocation;
  const factory CheckOutEvent.checkOut() = _CheckOut;
}
