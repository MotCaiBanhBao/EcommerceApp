part of 'message_bloc.dart';

@freezed
class MessageEvent with _$MessageEvent {
  const factory MessageEvent.started() = _Started;
  const factory MessageEvent.refreshChatNoti() = _RefreshChatNoti;
}
