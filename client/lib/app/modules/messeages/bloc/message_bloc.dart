import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notification_api/notification_api.dart';
import 'package:notification_repository/notification_repository.dart';

part 'message_event.dart';
part 'message_state.dart';
part 'message_bloc.freezed.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  MessageBloc(this._notificationRepository) : super(_Initial()) {
    on<_Started>(_onStarted);
    on<_RefreshChatNoti>(_refreshChatNoti);
  }

  NotificationRepository _notificationRepository;
  Future<void> _refreshChatNoti(_RefreshChatNoti event, Emitter emit) async {
    try {
      emit(state.copyWith(status: MessageStatus.loading));

      await _notificationRepository.getChatNotification().then((value) {
        if (value == null) {
          emit(state.copyWith(status: MessageStatus.failure));
        }
        emit(
            state.copyWith(status: MessageStatus.success, notification: value));
      });
    } catch (err) {
      emit(state.copyWith(status: MessageStatus.failure));
    }
  }

  Future<void> _onStarted(_Started event, Emitter emit) async {
    try {
      emit(state.copyWith(status: MessageStatus.loading));
      print('co chay');
      await _notificationRepository.getChatNotification().then((value) {
        if (value == null) {
          emit(state.copyWith(status: MessageStatus.failure));
        }
        emit(
            state.copyWith(status: MessageStatus.success, notification: value));
      });
    } catch (err) {
      emit(state.copyWith(status: MessageStatus.failure));
    }
  }
}
