import 'package:bloc/bloc.dart';
import 'package:cart_repository/cart_repository.dart';
import 'package:check_out_repository/check_out_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_event.dart';
part 'cart_state.dart';
part 'cart_bloc.freezed.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc(this._cartRepository) : super(_Initial()) {
    _cartRepository.getCart().listen((event) {
      add(const CartEvent.started());
    });
    on<_Started>(_onStarted);
    on<_Delete>(_onDelete);
    on<_UpdateQuantity>(_updateQuantity);
    on<_UpdateChoose>(_updateChoose);
  }
  final CartRepository _cartRepository;

  Future<void> _updateQuantity(
      _UpdateQuantity event, Emitter<CartState> emit) async {
    await _cartRepository.updateQuantity(
        event.counter, event.id, event.publisher);
  }

  Future<void> _updateChoose(
      _UpdateChoose event, Emitter<CartState> emit) async {
    await _cartRepository.updateChoose(
        event.isCheck, event.id, event.publisher);
  }

  Future<void> _onStarted(_Started event, Emitter<CartState> emit) async {
    emit(state.copyWith(status: CartStatus.loading));
    await emit.forEach<CartModel>(
      _cartRepository.getCart(),
      onData: (cart) {
        return state.copyWith(
          status: CartStatus.success,
          cartData: cart,
        );
      },
      onError: (_, __) => state.copyWith(
        status: CartStatus.failure,
      ),
    );
  }

  Future<void> _onDelete(_Delete event, Emitter<CartState> emit) async {
    emit(state.copyWith(status: CartStatus.loading));
    // await _cartRepository.deleteAllItem();
    await _cartRepository.deleteCartItem(event.id, event.publisher);
  }
}
