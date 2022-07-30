part of 'shop_register_bloc.dart';

@freezed
class ShopRegisterEvent with _$ShopRegisterEvent {
  const factory ShopRegisterEvent.submit(
      String address, String phoneNumber, String shopName) = _Submit;
}
