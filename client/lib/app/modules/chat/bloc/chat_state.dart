part of 'chat_bloc.dart';

enum ChatStatus {
  none,
  initial,
  started,
  success,
  failure,
  loading;

  bool get isLoadding => this == ChatStatus.loading;
  bool get isInitial => this == ChatStatus.initial;
  bool get isStarted => this == ChatStatus.started;
}

@freezed
class ChatState with _$ChatState {
  const factory ChatState(
      {@Default('') String roomId,
      @Default('') String userId,
      @Default('') String anotherId,
      @Default(null) Stream<List<MessageModel>>? chatData,
      @Default(ChatStatus.none) ChatStatus status}) = _Initial;
}
