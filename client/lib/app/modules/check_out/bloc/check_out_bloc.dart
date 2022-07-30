import 'package:bloc/bloc.dart';
import 'package:cart_api/cart_api.dart';
import 'package:check_out_repository/check_out_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

part 'check_out_event.dart';
part 'check_out_state.dart';
part 'check_out_bloc.freezed.dart';

class CheckOutBloc extends Bloc<CheckOutEvent, CheckOutState> {
  CheckOutBloc(this._checkOutRepository) : super(_Initial()) {
    on<_Started>(onStarted);
    on<_OnAddAddress>(_onAddAddress);
    on<_AutoLocation>(_autoLocation);
    on<_OnAddPhoneNumber>(_onAddPhoneNumber);
    on<_CheckOut>(_checkOut);
  }

  final CheckOutRepository _checkOutRepository;
  Future<void> _onAddAddress(
      _OnAddAddress event, Emitter<CheckOutState> emit) async {
    var newData = state.order;
    newData!.shippingAdress.address = event.address;
    emit(state.copyWith(
      order: newData,
    ));
  }

  Future<void> _checkOut(_CheckOut event, Emitter<CheckOutState> emit) async {
    try {
      print('aaa');
      emit(state.copyWith(status: CheckOutStatus.loading));
      await _checkOutRepository.pushOrder(state.order!).then((value) {
        if (value) {
          print('$value co chay ne');
          emit(state.copyWith(status: CheckOutStatus.checkoutSuccess));
        } else {
          print('$value co chay ne');
          emit(state.copyWith(status: CheckOutStatus.failure));
        }
      });
    } catch (err) {
      print('$err loiii');
      emit(state.copyWith(status: CheckOutStatus.failure));
    }
  }

  Future<void> _onAddPhoneNumber(
      _OnAddPhoneNumber event, Emitter<CheckOutState> emit) async {
    var newData = state.order;
    newData?.shippingAdress.phoneNumber = event.phoneNumber;
    emit(state.copyWith(
      order: newData,
    ));
  }

  Future<void> _autoLocation(
      _AutoLocation event, Emitter<CheckOutState> emit) async {
    try {
      final hasPermission = await _handleLocationPermission();
      if (!hasPermission) return;
      emit(state.copyWith(status: CheckOutStatus.loading));
      await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high)
          .then((Position position) async {
        await placemarkFromCoordinates(position.latitude, position.longitude)
            .then((value) {
          var newData = state.order;
          newData!.shippingAdress.address = "${[
            value[0].street,
            value[0].locality,
            value[0].administrativeArea,
            value[0].country
          ]}";
          emit(state.copyWith(status: CheckOutStatus.success, order: newData));
          //
        });
      }).catchError((e) {
        emit(state.copyWith(status: CheckOutStatus.failure));
      });
    } catch (err) {
      emit(state.copyWith(status: CheckOutStatus.failure));
    }
    // var newData = state.order;
    // newData!.address = event.address;
    // emit(state.copyWith(
    //   order: newData,
    // ));
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {}
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return false;
    }
    return true;
  }

  Future<void> onStarted(_Started event, Emitter<CheckOutState> emit) async {
    emit(state.copyWith(status: CheckOutStatus.loading));
    try {
      List<ShopProductItems> productItems = event.currentCart.items
          .map((e) => ShopProductItems(
              items: e.productItems
                  .where((element) => element.isCheck)
                  .toList()
                  .map((e) => ItemData(
                      name: e.name,
                      price: e.price,
                      productId: e.productId,
                      productImage: e.productImage,
                      quantity: e.quantity,
                      variation: e.variation,
                      variationData: e.variationData))
                  .toList(),
              publisherId: e.publisherId))
          .toList();

      emit(state.copyWith(
          order: CheckOutModel(
              items: productItems, shippingAdress: ShippingAddress('', '')),
          status: CheckOutStatus.success));
    } catch (err) {
      emit(state.copyWith(status: CheckOutStatus.failure));
    }
  }
}
