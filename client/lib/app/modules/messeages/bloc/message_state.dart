part of 'message_bloc.dart';

enum MessageStatus {
  none,
  initial,
  started,
  success,
  failure,
  loading;

  bool get isLoadding => this == MessageStatus.loading;
  bool get isInitial => this == MessageStatus.initial;
  bool get isStarted => this == MessageStatus.started;
}

@freezed
class MessageState with _$MessageState {
  const factory MessageState(
      {@Default(MessageStatus.none) MessageStatus status,
      @Default(null) MessageModel? notification}) = _Initial;
}
