import 'package:bloc/bloc.dart';
import 'package:cart_repository/cart_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:remote_products_api/products_api.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';
part 'home_bloc.g.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(_Initial()) {
    on<_Started>((event, emit) {});
    on<_BackApp>(_onBackApp);
    // on<_ChangePage>(_onChangePage);
  }

  Future<void> _onBackApp(_BackApp event, Emitter<HomeState> emit) async {
    if (state.currentPage == MenuState.dashboard) {
      await showDialog(
        context: event.context!,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Bạn có chắc'),
          content: const Text('Bạn có muốn thoát khỏi ứng dụng'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context, 'Cancel');
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                emit(state.copyWith(isBack: true));
                Navigator.pop(context, 'OK');
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}
